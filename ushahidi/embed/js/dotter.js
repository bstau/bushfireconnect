ushahidi = ushahidi || {};

ushahidi.Dotter = function(width, height) {
  this.width_ = width;
  this.height_ = height;
  this.cache = {};
};

ushahidi.Dotter.prototype.getDot = function(color) {
  if (!this.cache[color]) {
    this.cache[color] = this.generateDot_(color);
  }

  return this.cache[color];
};

ushahidi.Dotter.prototype.generateDot_ = function(color) {
  var el = document.createElement('canvas');
  el.width = this.width_;
  el.height = this.height_;

  var ctx = el.getContext('2d');
  ctx.fillStyle = 'black';
  ctx.fillRect(0, 0, el.width, el.height);
  ctx.fillStyle = color;
  ctx.fillRect(1, 1, el.width - 2, el.height - 2);

  return el.toDataURL();
};
