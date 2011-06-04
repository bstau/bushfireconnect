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

  this.menuControl = document.createElement('div');
  this.menuControl.id = 'mapmenu';

  this.searchControl = document.createElement('div');
  this.searchControl.id = 'searchroot';

  this.searchBox = document.createElement('input');
  this.searchBox.id = 'mapsearchterm';
  this.searchControl.appendChild(this.searchBox);

  this.layerButton = document.createElement('div');
  this.layerButton.id = 'maplayerbtn';
  this.menuControl.appendChild(this.layerButton);

  this.locateButton = document.createElement('div');
  this.locateButton.id = 'maplocatebtn';
  this.menuControl.appendChild(this.locateButton);
};

ushahidi.Map.prototype.buildHash_ = function() {
  var hash = [];
  var center = this.map_.getCenter();
  hash.push('c=' + center.lat() + ',' + center.lng());
  hash.push('z=' + this.map_.getZoom());
  hash.push('m=' + this.map_.getMapTypeId());
  window.location.hash = hash.join('|');
};
