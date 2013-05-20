//=require_tree ./
//=require underscore-min
//=require backbone-min
//=require models/portal
//=require collections/portals
//=require views/gmap

var map, portals;
$(function(){
	portals = new Portals();
	var gmap = new mapView({ el: $('#gmap')})
	var adv = new PortalsDashboardView({ el: $('#gmap'), collection: portals, map:gmap })
})

var PortalsDashboardView =  Backbone.View.extend({
	initialize: function() {
        
        this.gmap = this.options.map.map
		this.collection.on('add', this.appendPortal, this);
        this.collection.fetch()
	}

	, appendPortal: function(portal) {
		// this.$('ul').append('<li>' + status.escape('text') + '</li>');
        var pointLL = new google.maps.LatLng(portal.get('lat')/1000000, portal.get('lng')/1000000)
            , marker = new google.maps.Marker({
                position: pointLL
                , map: this.gmap
                , title: portal.get('name')
            })

        this.gmap
		console.log(marker)
	}
});