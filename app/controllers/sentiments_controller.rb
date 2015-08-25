require 'open-uri'
class SentimentsController < ApplicationController

	def twittersearch
		tweets = Tweet.twitter_search(params[:term])
		sent_array = Sentiment.check_sentiment_public(tweets)
		results = JSON.parse(sent_array.to_json)
		render json: results
	end

	#def fox_news
		#tweets = Tweet.fox_news_search(params[:tweet]) 
		#render json: tweets

	#end




end
