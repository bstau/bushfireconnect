function OSMLayer() {
  return new google.maps.ImageMapType(this);
}

OSMLayer.prototype.tileSize = new google.maps.Size(256, 256);

OSMLayer.prototype.alt = 'Open Street Map';

OSMLayer.prototype.name = 'OSM Base';

OSMLayer.prototype.servers_ = ['a', 'b', 'c'];

OSMLayer.prototype.getTileUrl = function(coord, zoom) {
  var numTiles = 1 << zoom;
  var x = coord.x % numTiles;
  x = x >= 0 ? x : x + numTiles;

  var y = coord.y;
  if (y < 0 || y >= numTiles) {
    return null;
  }

  var server = this.servers_[(49 * x + y) % this.servers_.length];
  return 'http://' + server + '.tile.openstreetmap.org/' + zoom + '/' + x + '/' + y + '.png'
};

OSMLayer.prototype.minZoom = 0;

OSMLayer.prototype.maxZoom = 18;

// TODO: attribution - (c) OpenStreetMap contributors, CC-BY-SA
