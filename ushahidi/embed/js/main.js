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
  google.maps.event.addListener(map, 'maptypeid_changed', function() {
    me.buildHash_();
  });
  google.maps.event.addListener(map, 'idle', function() {
    me.buildHash_();
  });

  this.geolocation_ = (ushahidi.Geolocation) ?
      new ushahidi.Geolocation(map) : null;

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

  var client = new XMLHttpRequest();
  if (client) {
    client.onreadystatechange = function() {
      if (4 == this.readyState && 200 == this.status) {
        var ll = document.getElementById('layerlist');
        if (!ll) return;

        data = eval('(' + this.responseText + ')');
        if (data.payload && data.payload.categories) {
          if (data.payload.categories.length) {
            var layerconfig = {};
            for (var i = 0; i < data.payload.categories.length; ++i) {
              var cat = data.payload.categories[i].category;
              var layer = null;
              if (0 == cat.parent_id) {
                layer = parseInt(cat.id);
                var elem = document.createElement('div');
                var cb = document.createElement('input');
                var lbl = document.createElement('label');
                cb.type = 'checkbox';
                cb.checked = true;
                cb.id = lbl.htmlFor = 'layer' + cat.id;
                cb.onchange = function(xcb, xid) { return function(e) {
                  for (var i = 0; i < me.layers.length; ++i) {
                    var l = me.layers[i];
                    if (l.setLayerVisibility) {
                      l.setLayerVisibility(xid, xcb.checked); // document.getElementById(cb.id).checked);
                    }
                  }
                }}(cb, parseInt(cat.id));
                var txt = document.createTextNode(' ' + cat.description);
                if (cat.color && cat.color.length) {
                  var colourIcon = document.createElement('div');
                  colourIcon.style.backgroundColor = '#' + cat.color;
                  colourIcon.className = 'layercolour';
                  elem.appendChild(colourIcon);
                }

                elem.className = 'layer';
                lbl.appendChild(txt);
                elem.appendChild(cb);
                elem.appendChild(lbl);
                ll.appendChild(elem); 
              } else {
                layer = parseInt(cat.parent_id);
              }
              if (layerconfig[layer])
                layerconfig[layer].push(parseInt(cat.id));
              else
                layerconfig[layer] = [parseInt(cat.id)];
            }

            me.layerconfig_ = layerconfig;
          } else {
            var lb = document.getElementById('layerbtn');
            if (lb) lb.style.display = 'none';
          }
        }
      } else if (this.status && this.status != 200) {
        var lb = document.getElementById('layerbtn');
        if (lb) lb.style.display = 'none';
      }
    };

    client.open('GET', '../api?task=categories&resp=json');
    client.send();
  }
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

