/**
 * @fileoverview Map object for Ushahidi API-based map.
 */

var ushahidi = ushahidi || {};

/**
 * Class to encapsulate map functionality.
 * @param {DOMElement} node DOM element containing the map
 * @param {Object} params Map configuration
 * @constructor
 */
ushahidi.Map = function(node, params) {
  this.params_ = params;
  this.layers = [];
  this.initMap_(node);
};

/**
 * Adds a new layer to the map.
 * @param {ushahidi.IncidentOverlay} layer New layer to add
 */
ushahidi.Map.prototype.addLayer = function(layer) {
  this.layers.push(layer);
  layer.setMap(this.map_);
  if (layer.setParent)
      layer.setParent(this);
};

/**
 * Inititalise the map.
 * @param {DOMElement} node Node to construct the map within.
 */
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

  this.geolocation_ = (ushahidi.Geolocation) ?
      new ushahidi.Geolocation(this) : null;

  if (this.params_.geolocate == true && this.geolocation_)  {
    this.geolocation_.updateLocation();
  }

  var layerBtn = document.getElementById('layerbtn');
  if (layerBtn) {
    layerBtn.onclick = function(e) {
      var l = document.getElementById('layerlist');
      if (l) {
        l.style.display = (l.style.display == 'block') ? 'none' : 'block';
      }
    };
  }

  var locateBtn = document.getElementById('my-location');
  if (locateBtn) {
    if (this.geolocation_) {
      locateBtn.onclick = function(e) {
        me.geolocation_.updateLocation(); 
      };
    } else {
      locateBtn.style.display = 'none';
    }
  }
}; 

/**
 * Get the encapsulated Google Map object.
 * @return {google.maps.Map}
 */
ushahidi.Map.prototype.getMap = function() {
  return this.map_;
};

/**
 * Update the anchor component of the page's URL.
 *
 * We include viewport and map type information in the page URL to permit
 * bookmarking and embedding of a given map view.
 *
 * Updates window.location.hash.
 */
ushahidi.Map.prototype.buildHash_ = function() {
  var hash = [];
  var center = this.map_.getCenter();
  hash.push('c=' + center.lat() + ',' + center.lng());
  hash.push('z=' + this.map_.getZoom());
  hash.push('m=' + this.map_.getMapTypeId());
  window.location.hash = hash.join('|');
};


/**
 * Set the current map position from the user's location.
 *
 * Uses the HTML5 geolocation API to get the user's location, then updates
 * the center of the map's viewport. Also sets zoom to level 13 if the user
 * is zoomed out wider than zoom level 10.
 */
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

