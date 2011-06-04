var ushahidi = ushahidi || {};

ushahidi.Map = function(node, params) {
  this.params_ = params;
  this.initMap_(node);
};

ushahidi.Map.prototype.addLayer = function(layer) {
  layer.setMap(this.map_);
};

ushahidi.Map.prototype.initMap_ = function(node) {
  var me = this;
  var map = this.map_ = new google.maps.Map(node, {
    center: this.params_.center,
    zoom: this.params_.zoom,
    mapTypeId: this.params_.maptype,
    mapTypeControlOptions: {
      mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain', 'osm']
    }
  });

  map.mapTypes.set('osm', osm = new OSMLayer());

  google.maps.event.addListener(map, 'maptypeid_changed', function() {
    me.buildHash_();
  });
  google.maps.event.addListener(map, 'idle', function() {
    me.buildHash_();
  });
};

ushahidi.Map.prototype.getMap = function() {
  return this.map_;
};

ushahidi.Map.prototype.buildHash_ = function() {
  var hash = [];
  var center = this.map_.getCenter();
  hash.push('c=' + center.lat() + ',' + center.lng());
  hash.push('z=' + this.map_.getZoom());
  hash.push('m=' + this.map_.getMapTypeId());
  window.location.hash = hash.join('|');
};
