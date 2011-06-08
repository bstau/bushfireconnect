ushahidi.LayerControl = function(api, button, list) {
  this.api_ = api;
  this.button_ = button;
  this.list_ = list;
  this.initDom_();
};

ushahidi.LayerControl.prototype.toggle = function() {
  this.list_.className = !this.list_.className ? 'hidden' : '';
};

ushahidi.LayerControl.prototype.initDom_ = function() {
  var me = this;
  google.maps.event.addDomListener(this.button_, 'click', function() {
    me.toggle();
  });

  this.api_.getCategories(function(data) {
    if (!data.payload || !data.payload.categories) {
      return;
    }
    for (var i = 0, ii = data.payload.categories.length; i < ii; ++i) {
      var category = data.payload.categories[i].category;
      if (category.parent_id === "0") {
        me.list_.appendChild(me.createCategoryElement_(category));
      }
    }
  });
}

ushahidi.LayerControl.prototype.createCategoryElement_ = function(category) {
  var elem = document.createElement('div');
  var cb = document.createElement('input');
  var lbl = document.createElement('label');
  cb.type = 'checkbox';
  cb.id = lbl.htmlFor = 'layer' + category.id;
  var txt = document.createTextNode(' ' + category.description);

  if (category.color && category.color.length) {
    var colourIcon = document.createElement('div');
    colourIcon.style.backgroundColor = '#' + category.color;
    colourIcon.className = 'layercolour';
    elem.appendChild(colourIcon);
  }

  elem.className = 'layer';
  lbl.appendChild(txt);
  elem.appendChild(cb);
  elem.appendChild(lbl);
  return elem;
};
