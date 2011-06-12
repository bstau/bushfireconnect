ushahidi.Geolocation = function(map) {
  this.map_ = map;
  this.location_ = map.getCenter();
  this.zoomLevel_ = 12
  this.api_ = new ushahidi.Api('../');
};

ushahidi.Geolocation.prototype.updateLocation = function() {
  var me = this;
  this.browserSupportFlag_ = false;
  if(navigator.geolocation) {
    me.browserSupportFlag_ = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      me.location_ = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      me.updateMap_("Location found using W3C standard");
    }, function() {
      me.handleNoGeolocation_();
    });
  } else if (google.gears) {
    // Try Google Gears Geolocation
    me.browserSupportFlag_ = true;
    var geo = google.gears.factory.create('beta.geolocation');
    geo.getCurrentPosition(function(position) {
      me.location_ = new google.maps.LatLng(position.latitude,position.longitude);
      me.updateMap_("Location found using Google Gears");
    }, function() {
      me.handleNoGeolocation_(browserSupportFlag);
    });
  } else {
    // Browser doesn't support Geolocation
    browserSupportFlag = false;
    me.handleNoGeolocation_(browserSupportFlag);
  }
}

ushahidi.Geolocation.prototype.handleNoGeolocation_ = function() {
  if (this.browserSupportFlag_ == true) {
    contentString = "Error: The Geolocation service failed.";
  } else {
    contentString = "Error: Your browser doesn't support geolocation.";
  }
  alert(contentString);
}

ushahidi.Geolocation.prototype.calculateAppropriateZoom = function() {
  var bounds = this.map_.getBounds();
  var southWest = bounds.getSouthWest();
  var minLongitude = southWest.lng();
  var minLatitude = southWest.lat();
  var northEast = bounds.getNorthEast();
  var maxLongitude = northEast.lng();
  var maxLatitude = northEast.lat();
  google.maps.event.clearListeners(this.map_, 'idle');
  this.detectViewPort(minLongitude, minLatitude, maxLongitude, maxLatitude, 1);
}

ushahidi.Geolocation.prototype.detectViewPort = function(minLongitude, minLatitude, maxLongitude, maxLatitude, n) {
  var me = this;

  this.api_.getIncidentsWithinBounds(minLongitude, minLatitude, maxLongitude, maxLatitude, function(resp) {
    var incidents = resp.payload.incidents
    if((incidents != undefined && incidents.length != 0) || n == 20) {
      var bounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(minLatitude, minLongitude),
        new google.maps.LatLng(maxLatitude, maxLongitude)
      );
      me.map_.fitBounds(bounds);
    }
    else {
      var delta = n * n * 0.1;
      me.detectViewPort(minLongitude - delta, minLatitude - delta, maxLongitude + delta, maxLatitude + delta, n + 1);
    }
  });
}

ushahidi.Geolocation.prototype.updateMap_ = function(contentString) {
  var me = this;
  this.autoZoomCallBack =
  google.maps.event.addListener(this.map_, 'idle', function() {
     me.calculateAppropriateZoom();
  });
  this.map_.setCenter(this.location_);
  this.map_.setZoom(this.zoomLevel_);
}