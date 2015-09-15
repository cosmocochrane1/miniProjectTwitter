// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require backbone
//= require handlebars
//= require_self
//= require_tree ./backbone/routers
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./templates
//= require chart.js
//= require_tree .
'use strict';
var App = {
    Models: {}, 
    Collections: {}, 
    Views: {}, 
    Routers: {},
    initialize: function() {
        //----- New York Times --------//
        this.collection = new App.Collections.NytCollection();
        this.listView = new App.Views.NytapiList({collection: this.collection});
    }
};
$(function() {
    App.initialize();
    $("#page3_button").click(function(){
        $('html, body').animate({scrollTop: $("#page_1").offset().top}, 100);
        console.log("AGHHHHHHHH")
    });
            
    $("#searchButton").click(function(){
        $('html, body').animate({scrollTop: $("#page_2").offset().top}, 2000);
        $(".loadingMessagesDiv").empty();
        $('#graph').empty();
        $('#graph').html('<canvas id="myChart" width="400" height="400"></canvas>');
        var searchTerm = $("#searchTerm").val();
        $("#searchTerm").val('') 
        searchTerm = encodeURI(searchTerm)

        var data = {
            searchTerm: searchTerm
        };
        App.listView.nytfetch(data);

        $(".loadingAdvert").html('<iframe width="560" height="315" src="https://www.youtube.com/embed/Mzze76A-kkk?autoplay=1&cc_load_policy=1" frameborder="0" allowfullscreen></iframe>');
        var loadingMessages = ["Fetching data", "Analyzing articles", "Computing sentiments", "Making graph"];
        
        for (var i = 0; i < loadingMessages.length; i++){
          renderLoading(i)
        };

        renderingGraph(searchTerm);
    });
});//end $(function()

var renderLoading = function (index){
    setTimeout(function  () {
        var loadingMessages = ["Fetching data", "Analyzing articles", "Computing sentiments", "Making graph"];
        var temp = "<h3>" + loadingMessages[index] + "</h3>"
        console.log(temp);
        $(".loadingMessagesDiv").append(temp);
    }, index * 8000)
};
var renderingGraph = function(searchTerm){
    console.log("Inside rendering graph in app.js"); 
    $.ajax({ 
        url: '/twittersearch', 
        data: {
            term: searchTerm
        }
    }).fail(function(){
        alert("FAILED AJAX")
    }).done(function(result){
        //result needs to hold array of arrays of percent changes for each category
        $('html, body').animate({scrollTop: $("#myChart").offset().top}, 2000);
        var ctx = document.getElementById('myChart').getContext("2d");
        var data = {
            labels: ["Five days ago", "Four days ago", "Three days ago", "Two days ago", "Yesterday", "Today"],
            datasets: [
                {
                    label: "General Population",
                    fillColor: "rgba(220,220,220,0)",
                    strokeColor: "#808080",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: result[0]
                },
                {
                    label: "Fox News",
                    fillColor: "rgba(151,187,205,0)",
                    strokeColor: "#BD1414",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: result[1]
                },
                {
                    label: "The Guardian News",
                    fillColor: "rgba(121,117,165,0)",
                    strokeColor: "blue",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: result[2]
                }
                
            ]
        };
        var options = {
            ///Boolean - Whether grid lines are shown across the chart
            scaleShowGridLines : true,
            //String - Colour of the grid lines
            scaleGridLineColor : "rgba(0,0,0,.2)",
            //Number - Width of the grid lines
            scaleGridLineWidth : 1,
            //Boolean - Whether to show horizontal lines (except X axis)
            scaleShowHorizontalLines: true,
            //Boolean - Whether to show vertical lines (except Y axis)
            scaleShowVerticalLines: true,
            //Boolean - Whether the line is curved between points
            bezierCurve : true,
            //Number - Tension of the bezier curve between points
            bezierCurveTension : 0.4,
            //Boolean - Whether to show a dot for each point
            pointDot : true,
            //Number - Radius of each point dot in pixels
            pointDotRadius : 4,
            //Number - Pixel width of point dot stroke
            pointDotStrokeWidth : 1,
            //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
            pointHitDetectionRadius : 20,
            //Boolean - Whether to show a stroke for datasets
            datasetStroke : true,
            //Number - Pixel width of dataset stroke
            datasetStrokeWidth : 2,
            //Boolean - Whether to fill the dataset with a colour
            datasetFill : true,
            //String - A legend template
            legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
        };
        var chart = new Chart(ctx).Line(data, options);
    })
}