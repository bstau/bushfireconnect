var ushahidi = ushahidi || {};

ushahidi.Map = function(node, params) {
  this.params_ = params;
  this.initMap_(node);
};

ushahidi.Map.prototype.initMap_ = function(node) {
  var me = this;
  this.map_ = new google.maps.Map(node, {
    center: this.params_.center,
    zoom: this.params_.zoom,
    mapTypeId: this.params_.maptype
  });

  google.maps.event.addListener(this.map_, 'maptypeid_changed', function() {
    me.buildHash_();
  });
  google.maps.event.addListener(this.map_, 'idle', function() {
    me.buildHash_();
  });
};

ushahidi.Map.prototype.buildHash_ = function() {
  var hash = [];
  var center = this.map_.getCenter();
  hash.push('c=' + center.lat() + ',' + center.lng());
  hash.push('z=' + this.map_.getZoom());
  hash.push('m=' + this.map_.getMapTypeId());
  window.location.hash = hash.join('|');
};
