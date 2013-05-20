//=require_tree ./
//=require underscore-min
//=require backbone-min
//=require models/portal
//=require collections/portals

//=require views/gmap
var map, portals;
$(function(){
	portals = new Portals();
	var adv = new AreaDashboardView({ el: $('#gmap'), collection: portals })  	
	var gmap = new mapView({ el: $('#gmap')})
})

var AreaDashboardView =  Backbone.View.extend({
    initialize: function() {
        this.collection.on('add', this.appendPortal, this);
  		this.collection.fetch()
    }

    , appendPortal: function(portal) {
        // this.$('ul').append('<li>' + status.escape('text') + '</li>');
        console.log(portal)
    }
});