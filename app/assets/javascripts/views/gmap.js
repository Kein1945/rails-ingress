var mapView =  Backbone.View.extend({
    initialize: function() {
    	this.initMap()
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
  		google.maps.event.addListener(this.map, 'dragend', _.bind(this.mapDragEnd, this) );
  		google.maps.event.addListener(this.map, 'zoom_changed', _.bind(this.mapZoomChange, this) );
    }

    , getLat: function(){
    	return $.cookie(mapView.const.lat) || 59.93768449963069
    }
    , getLng: function(){
    	return $.cookie(mapView.const.lng) || 30.305221557617188
    }

    , mapDragEnd: function(){
    	var bounds = this.map.getBounds()
					, ne = bounds.getNorthEast()
					, sw = bounds.getSouthWest()
					, center = bounds.getCenter()
					, region = {
						HLat: ne.lat()*1000000
						, RLon: ne.lng()*1000000
						, LLat: sw.lat()*1000000
						, LLon: sw.lng()*1000000
						, CLat: center.lat()*1000000
						, CLng: center.lng()*1000000
					};
		$.cookie(mapView.const.lat, center.lat())
		$.cookie(mapView.const.lng, center.lng())
    }

    , mapZoomChange: function(){
		$.cookie(mapView.const.zoom, this.map.getZoom())
    }

});
mapView.const = {}
mapView.const.lat = 'map.lat'
mapView.const.lng = 'map.lng'
mapView.const.zoom = 'map.zoom'