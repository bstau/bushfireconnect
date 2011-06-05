// TODO: some way to customise and filter the markers
// TODO: modal dialog instead of info window
ushahidi.IncidentOverlay = function(api) {
  this.api_ = api;
  this.visibleLayers = [];
  for (var i = 0; i < 10000; ++i)
    this.visibleLayers.push(i);
};

ushahidi.IncidentOverlay.prototype.getVisibleCategories = function () {
  var a = [];

  if (!this.ushahidiMap_ || !this.ushahidiMap_.layerconfig_)
    return a;

  var config = this.ushahidiMap_.layerconfig_;
  for (var i = 0; i < this.visibleLayers.length; ++i) {
    var layer = config[parseInt(this.visibleLayers[i])];
    if (layer) {
        for (var j = 0; j < layer.length; ++j) {
            if (a.indexOf(layer[j]) < 0)
                a.push(layer[j]);
        }
    }

  }
  return a;
}

ushahidi.IncidentOverlay.prototype.setMap = function(map) {
  var me = this;
  this.map_ = map;
  this.api_.getIncidents(function(resp) {
    me.setIncidents_(resp.payload.incidents);
  });
  var infowindow = new google.maps.InfoWindow;
  google.maps.event.addListener(map, 'incident_changed', function() {
    var incident = this.get('incident');
    var content = [];
    content.push('<div class="incident"><h3>');
    content.push(incident.incident.incidenttitle);
    content.push('</h3><p>');
    content.push(incident.incident.incidentdescription);
    content.push('</p></div>');
    infowindow.setContent(content.join(''));
    infowindow.open(map, incident.marker_);
  });
};

ushahidi.IncidentOverlay.prototype.setParent = function(ushaMap) {
  this.ushahidiMap_ = ushaMap;
}

ushahidi.IncidentOverlay.prototype.setIncidents_ = function(incidents) {
  var map = this.map_;
  this.incidents_ = incidents;

  for (var i = 0, ii = incidents.length; i < ii; i++) {
    var incident = incidents[i].incident;
    var loc = new google.maps.LatLng(incident.locationlatitude,
        incident.locationlongitude);

    var marker = new google.maps.Marker({
      position: loc,
      map: map
    });
    marker.incident_ = incidents[i];
    incidents[i].xmarker_ = marker;

    google.maps.event.addListener(marker, 'click',
        ushahidi.IncidentOverlay.markerClick_);
  }
};

/**
 * @this google.maps.Marker
 */
ushahidi.IncidentOverlay.markerClick_ = function() {
  var incident = this.incident_;
  incident.marker_ = this;
  this.getMap().set('incident', incident);
};

ushahidi.IncidentOverlay.prototype.setLayerVisibility = function(layer, vis) {
  if (vis) {
    if (this.visibleLayers.indexOf(layer) < 0)
        this.visibleLayers.push(layer);
  } else {
    var idx = this.visibleLayers.indexOf(layer);
    if (idx >= 0)
        this.visibleLayers.splice(idx, 1);
  }

  var cats = this.getVisibleCategories();

  if (!this.incidents_)
    return;

  for (var i = 0; i < this.incidents_.length; ++i) {
    if (this.incidents_[i].xmarker_) {
        var isVis = false;
        for (var j = 0; j < this.incidents_[i].categories.length && !isVis; ++j) {
            if (cats.indexOf(parseInt(this.incidents_[i].categories[j].category.id)) >= 0) {
              isVis = true;
              }
        }
        this.incidents_[i].xmarker_.setVisible(isVis);
    }
  }
};

ushahidi.IncidentOverlay.prototype.showLayer = function(layer) {
    this.setLayerVisibility(layer, true);
};

ushahidi.IncidentOverlay.prototype.hideLayer = function(layer) {
    this.setLayerVisibility(layer, false);
};

