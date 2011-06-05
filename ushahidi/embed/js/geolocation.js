ushahidi.Geolocation = function(map) {
  this.map_ = map.getMap();
  this.location_ = this.map_.getCenter();
  this.zoomLevel_ = 12
  this.marker_ = new google.maps.Marker({
    map: this.map_,
    icon: new google.maps.MarkerImage(
      'http://oa-samples.googlecode.com/svn-history/r73/trunk/' +
        'presentations/gdd-2010/saopaulo/talks/maps/my-location.png',
          null, null, new google.maps.Point(6, 7)),
    flat: true
  });
  this.circle_ = new google.maps.Circle;
  this.circle_.bindTo('center', this.marker_, 'position');
  this.circle_.bindTo('map', this.marker_);
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
  } else {
    // Browser doesn't support Geolocation
    browserSupportFlag = false;
    me.handleNoGeolocation_(browserSupportFlag);
  }
};

ushahidi.Geolocation.prototype.handleNoGeolocation_ = function() {
  // noop
};

ushahidi.Geolocation.prototype.updateMap_ = function() {
  var map = this.map_;
  map.setCenter(this.location_);
  map.setZoom(this.zoomLevel_);

  this.marker_.setPosition(this.location_);

  this.circle_.setOptions({
    radius: this.accuracy_,
    strokeColor: '#44c4ff',
    fillColor: '#44c4ff'
  });
};
