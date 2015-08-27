App.Collections.NytCollection = Backbone.Collection.extend({

	url: '/nytapi',
	model: App.Models.Nyt,

	initialize: function() {
		console.log('New collection created');
	},




})