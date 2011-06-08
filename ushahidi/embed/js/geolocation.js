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

ushahidi.Geolocation.prototype.updateMap_ = function(contentString) {
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

ushahidi.Geolocation.getZoomLevel = function(accuracy_m) {
  // Cap the zoom level to treat it as 50 meter accuracy, useful for '0' accuracy values to avoid log(0).
  var accuracy = accuracy_m > 50 ? accuracy_m : 50;
  // Only approximate!
  var accuracyDeg = accuracy * 360.0 / 30000000;
  // Take log_2(accuracyDeg)
  var zoomLevel = Math.floor(-1 * Math.log((accuracyDeg * 10) / 360.0) / Math.LN2);

  // Cap zoom levels at 3..14.
  if (zoomLevel < 3) zoomLevel = 3;
  if (zoomLevel > 14) zoomLevel = 14;
}

ushahidi.Geolocation.prototype.updateMap_ = function(location, accuracy) {
  var map = this.map_;
  this.zoomLevel_ = ushahidi.Geolocation.getZoomLevel(accuracy);

  map.panTo(location);
  map.setZoom(this.zoomLevel_);

  this.marker_.setPosition(location);
  this.marker_.setMap(map);
  this.marker.setVisible(true);

  this.circle_.setOptions({
    radius: accuracy,
    strokeColor: '#44c4ff',
    fillColor: '#44c4ff'
  });
};
