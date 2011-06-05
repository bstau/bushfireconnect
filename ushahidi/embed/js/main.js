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

  var marker = new google.maps.Marker({
    map: this.map_,
    draggable: true,
    icon: new google.maps.MarkerImage(
      'http://oa-samples.googlecode.com/svn-history/r73/trunk/' +
      'presentations/gdd-2010/saopaulo/talks/maps/my-location.png',
      null, null, new google.maps.Point(6, 7)),
    flat: true,
    raiseOnDrag: false
  });

  this.geolocation_ = null;
  if (ushahidi.Geolocation) {
    this.geolocation_ = new ushahidi.Geolocation(this.map_);
  }

  if (this.params_.geolocate == true && this.geolocation_)  {
    this.geolocation_.updateLocation();
  }

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
          } else {
            var lb = document.getElementById('layerbtn');
            if (lb) lb.style.display = 'none';
          }
        }
      } else {
        var lb = document.getElementById('layerbtn');
        if (lb) lb.style.display = 'none';
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

