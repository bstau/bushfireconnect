// TODO: some way to customise and filter the markers
// TODO: modal dialog instead of info window
ushahidi.IncidentOverlay = function(api, dotter) {
  this.api_ = api;
  this.dotter_ = dotter;
};

ushahidi.IncidentOverlay.prototype.setMap = function(map) {
  var me = this;
  me.map_ = map;
  me.api_.getCategories(function(resp) {
    var catsA = resp.payload.categories;
    var cats = {};
    for (var i = 0; i < catsA.length; i++) {
      var cat = catsA[i].category;
      cats[cat.id] = cat;
    }
    me.api_.getIncidents(function(resp) {
      me.setIncidents_(resp.payload.incidents, cats);
    });
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

ushahidi.IncidentOverlay.prototype.setIncidents_ = function(incidents, cats) {
  var map = this.map_;

  for (var i = 0, ii = incidents.length; i < ii; i++) {
    var incident = incidents[i].incident;
    var category = incidents[i].categories[0].category;
    var loc = new google.maps.LatLng(incident.locationlatitude,
        incident.locationlongitude);

    var color = '#' + cats[category.id].color;
    var marker = new google.maps.Marker({
      position: loc,
      map: map,
      icon: this.dotter_.getDot(color)
    });
    marker.incident_ = incidents[i];

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
