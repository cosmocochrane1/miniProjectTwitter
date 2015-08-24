require 'open-uri'
class SentimentsController < ApplicationController

	def twittersearch
		#binding.pry
		tweets = Tweet.twitter_search(params[:tweet])
		Sentiment.check_sentiment_public(tweets)
	end

	def fox_news
		tweets = Tweet.fox_news_search(params[:tweet]) 
		page = Nokogiri::HTML(open("http://t.co/XgWE1kD1Yc"))    
		puts "***********************************" 
		puts page
		render json: tweets

	end


end
