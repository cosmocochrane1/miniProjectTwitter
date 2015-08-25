require 'open-uri'
class SentimentsController < ApplicationController

	def twittersearch
		binding.pry
		tweets = Tweet.twitter_search(params[:term])
		var sent_array = Sentiment.check_sentiment_public(tweets)
		return sent_array
	end

	#def fox_news
		#tweets = Tweet.fox_news_search(params[:tweet]) 
		#render json: tweets

	#end




end
