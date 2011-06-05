var ushahidi = ushahidi || {};

ushahidi.Map = function(node, params) {
  this.params_ = params;
  this.layers = [];
  this.initMap_(node);
};

ushahidi.Map.prototype.addLayer = function(layer) {
  this.layers.push(layer);
  layer.setMap(this.map_);
  if (layer.setParent)
      layer.setParent(this);
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

  google.maps.event.addListener(this.map_, 'maptypeid_changed', function() {
    me.buildHash_();
  });
  google.maps.event.addListener(map, 'idle', function() {
    me.buildHash_();
  });
};

/**
 * @return {google.maps.Map}
 */
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


function getCurrentPosition(map, marker) {
  if (!navigator.geolocation) {
    return;
  }
  navigator.geolocation.getCurrentPosition(function(p) {
    var ll = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);
    if (map.getZoom() < 10)
        map.setZoom(13);
    map.setCenter(ll);
  });
}

