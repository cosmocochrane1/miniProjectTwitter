App.Views.Nytapi = Backbone.View.extend({
	tagName: 'div',
	className: 'nytapi',
	initialize: function() {
		console.log('Nytapi View');
		this.template = HandlebarsTemplates['nytapi'];
		this.render();
	},
	render: function(){
		console.log('RENDER WAS CALLED!')
		jsonObject = this.model.toJSON();
		jsonObject.changedDate = jsonObject.pub_date.slice(0,10) 
		this.$el.html(this.template(jsonObject));
		$('body').append(this.$el);
	}
});
