//=require jquery.cookie
//=require underscore-min
//=require backbone-min

var mapView =  Backbone.View.extend({
	initialize: function() {
		this.initMap()
		google.maps.event.addListener(this.map, 'center_changed', _.bind(this.onCenterChange, this) );
		google.maps.event.addListener(this.map, 'zoom_changed', _.bind(this.onZoomChange, this) );
	}

	, initMap: function() {
		var mapOptions = {
			zoom: parseInt($.cookie(mapView.const.zoom)) || 10,
			center: new google.maps.LatLng(
				this.getLat()
				, this.getLng()),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
  		this.map = new google.maps.Map(this.el, mapOptions);
	}

	, getLat: function(){
		return $.cookie(mapView.const.lat) || 59.93768449963069
	}
	, getLng: function(){
		return $.cookie(mapView.const.lng) || 30.305221557617188
	}

	, getAreaLatLng: function(){
		var bounds = this.map.getBounds()
					;ne = bounds.getNorthEast()
					sw = bounds.getSouthWest()
		return {
				HLat: ne.lat()*1000000
				, RLng: ne.lng()*1000000
				, LLat: sw.lat()*1000000
				, LLng: sw.lng()*1000000
			}
	}

	, onCenterChange: function(){
		var bounds = this.map.getBounds()
			, center = bounds.getCenter()
		$.cookie(mapView.const.lat, center.lat())
		$.cookie(mapView.const.lng, center.lng())
	}

	, onZoomChange: function(){
		$.cookie(mapView.const.zoom, this.map.getZoom())
	}

});

// Cookie names
mapView.const = {}
mapView.const.lat = 'map.lat'
mapView.const.lng = 'map.lng'
mapView.const.zoom = 'map.zoom'