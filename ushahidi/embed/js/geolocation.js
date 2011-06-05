ushahidi.Geolocation = function(map) {
  this.map_ = map;
  this.location_ = map.getCenter();
  this.zoomLevel_ = 12
  this.infoWindow_ = new google.maps.InfoWindow();
};

ushahidi.Geolocation.prototype.updateLocation = function() {
  var me = this;
  this.browserSupportFlag_ = false;
  if(navigator.geolocation) {
    me.browserSupportFlag_ = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      me.location_ = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      me.accuracy_ = position.coords.accuracy;
      me.updateMap_();
    }, function() {
      me.handleNoGeolocation_();
    });
  } else if (google.gears) {
    // Try Google Gears Geolocation
    me.browserSupportFlag_ = true;
    var geo = google.gears.factory.create('beta.geolocation');
    geo.getCurrentPosition(function(position) {
      me.location_ = new google.maps.LatLng(position.latitude,position.longitude);
      me.accuracy_ = position.accuracy;
      me.updateMap_();
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
  this.updateMap_(contentString);
}

ushahidi.Geolocation.prototype.updateMap_ = function(contentString) {
  this.map_.setCenter(this.location_);
  this.map_.setZoom(this.zoomLevel_);

  if (!this.marker) {
    this.marker = new google.maps.Marker({
        visible: false,
        map: this.map_,
        draggable: false,
        icon: new google.maps.MarkerImage(
          'http://oa-samples.googlecode.com/svn-history/r73/trunk/' +
            'presentations/gdd-2010/saopaulo/talks/maps/my-location.png',
              null, null, new google.maps.Point(6, 7)),
        flat: true,
        raiseOnDrag: false});
  }

  if (!this.markerCircle) {
    this.markerCircle = new google.maps.Circle({
        map: this.map_,
        radius: this.accuracy_,
        strokeColor: '#44c4ff',
        fillColor: '#44c4ff'
    });
    this.markerCircle.bindTo('center', this.marker, 'position');
  }

  this.marker.setPosition(this.location_);
  this.marker.setVisible(true);
}
