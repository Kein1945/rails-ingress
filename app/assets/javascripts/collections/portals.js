var Portals = Backbone.Collection.extend({
    model: Portal
    , url: '/portals'
    , lat: 59.93768449963069
    , lng: 30.305221557617188
    // , fetch: function(options){
    // 	options || (options = {});
    //     var data = (options.data || {});
    //     options.data = {date: this.date};

    //     return Backbone.Collection.prototype.fetch.call(this, options);
    // }
});