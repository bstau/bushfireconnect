// TODO: some way to customise and filter the markers
// TODO: modal dialog instead of info window
ushahidi.IncidentOverlay = function(api) {
  this.api_ = api;
};

ushahidi.IncidentOverlay.prototype.setMap = function(map) {
  var me = this;
  me.map_ = map;
  me.api_.getIncidents(function(resp) {
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

ushahidi.IncidentOverlay.prototype.setIncidents_ = function(incidents) {
  var map = this.map_;

  for (var i = 0, ii = incidents.length; i < ii; i++) {
    var incident = incidents[i].incident;
    var loc = new google.maps.LatLng(incident.locationlatitude,
        incident.locationlongitude);

    var marker = new google.maps.Marker({
      position: loc,
      map: map
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
