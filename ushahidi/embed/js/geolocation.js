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
  this.updateMap_(contentString);
}

ushahidi.Geolocation.prototype.updateMap_ = function(contentString) {
  this.map_.setCenter(this.location_);
  this.map_.setZoom(this.zoomLevel_)
  this.infoWindow_.setContent(contentString);
  this.infoWindow_.setPosition(this.location_);
  this.infoWindow_.open(this.map_);
}