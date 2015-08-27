App.Views.NytapiList = Backbone.View.extend({
	el: '.nyt_api',
	initialize: function() {
		console.log('New List View');
		this.listenTo(this.collection, 'reset', this.addAll);
	},
	addAll: function() {
		this.collection.each(this.addNyt, this);
	},
	addNyt: function(nytmodel) {
		var article = new App.Views.Nytapi({ model: nytmodel});
		this.$el.append(article.el);
	},
	nytfetch: function() {
		console.log("fuck");
		this.collection.fetch({reset: true});
	}
	

})