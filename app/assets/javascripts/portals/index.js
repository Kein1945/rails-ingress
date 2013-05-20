// require_tree ./
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
		this.map = this.options.map
		this.queryPortals = null

		this.collection.on('add', this.appendPortal, this);

		google.maps.event.addListener(this.gmap, 'bounds_changed', _.bind(this.uploadPortals, this) );
	}

	, uploadPortals: function(){
		if( null != this.queryPortals ){
			clearTimeout(this.queryPortals)
		}

		this.queryPortals = setTimeout(_.bind( function(){
			this.collection.fetch({data: this.map.getAreaLatLng()})
		}, this), 1000)
		
	}

	, appendPortal: function(portal) {
		var point = new google.maps.LatLng(portal.get('lat')/1000000, portal.get('lng')/1000000)
			, marker = new google.maps.Marker({
				position: point
				, map: this.gmap
				, title: portal.get('name')
			})
	}
});