ushahidi.Geolocation = function(map) {
  this.map_ = map.getMap();
  this.location_ = this.map_.getCenter();
  this.zoomLevel_ = 12

  this.marker_ = new google.maps.Marker({
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
  navigator.geolocation.getCurrentPosition(function(position) {
    var location = new google.maps.LatLng(position.coords.latitude,
                                          position.coords.longitude);
    var accuracy = position.coords.accuracy;
    me.updateMap_(location, accuracy);
  });
};

ushahidi.Geolocation.prototype.updateMap_ = function(location, accuracy) {
  var map = this.map_;
  map.panTo(location);
  map.setZoom(this.zoomLevel_);

  this.marker_.setPosition(location);
  this.marker_.setMap(map);

  this.circle_.setOptions({
    radius: accuracy,
    strokeColor: '#44c4ff',
    fillColor: '#44c4ff'
  });
};
