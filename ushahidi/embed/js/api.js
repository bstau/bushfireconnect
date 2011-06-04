ushahidi.Api = {};

ushahidi.Api = function(base) {
  this.base_ = base;
};

ushahidi.Api.prototype.getIncidents = function(callback) {
  $.getJSON(this.base_ + 'api?task=incidents', callback);
};

ushahidi.Api.prototype.getIncidentsByCategoryId = function(id, callback) {
  $.getJSON(this.base_ + 'api?task=incidents&by=catid', { id: id }, callback);
};

ushahidi.Api.prototype.getIncidentsByCategoryName = function(name, callback) {
  $.getJSON(this.base_ + 'api?task=incidents&by=catname', { name: name }, callback);
};

ushahidi.Api.prototype.getIncidentsCentroid = function(callback) {
  $.getJSON(this.base_ + 'api?task=geographicmidpoint', callback);
};

ushahidi.Api.prototype.getCategories = function(callback) {
  $.getJSON(this.base_ + 'api?task=categories', callback);
};
