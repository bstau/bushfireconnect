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

  var layerBtn = document.getElementById('layerbtn');
  if (layerBtn) {
    layerBtn.onclick = function(e) {
      var l = document.getElementById('layerlist');
      if (l) {
        l.style.display = (l.style.display == 'block') ? 'none' : 'block';
      }
    };
  }

  var client = new XMLHttpRequest();
  if (client) {
    client.onreadystatechange = function() {
      if (4 == this.readyState && 200 == this.status) {
        var ll = document.getElementById('layerlist');
        if (!ll) return;

        data = eval('(' + this.responseText + ')');
        if (data.payload && data.payload.categories) {
          for (var i = 0; i < data.payload.categories.length; ++i) {
            var cat = data.payload.categories[i].category;
            if (0 == cat.parent_id) {
              var elem = document.createElement('div');
              var cb = document.createElement('input');
              var lbl = document.createElement('label');
              cb.type = 'checkbox';
              cb.id = lbl.htmlFor = 'layer' + cat.id;
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
            }
          }
        }
      }
    };

    client.open('GET', '../api?task=categories&resp=json');
    client.send();
  }
};

ushahidi.Map.prototype.buildHash_ = function() {
  var hash = [];
  var center = this.map_.getCenter();
  hash.push('c=' + center.lat() + ',' + center.lng());
  hash.push('z=' + this.map_.getZoom());
  hash.push('m=' + this.map_.getMapTypeId());
  window.location.hash = hash.join('|');
};
