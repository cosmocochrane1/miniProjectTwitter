require 'open-uri'
class SentimentsController < ApplicationController

	def twittersearch
		#binding.pry
		tweets = Tweet.twitter_search(params[:tweet])
		render json: tweets
		Sentiment.check_sentiment(tweets)
	end

	def fox_news
		tweets = Tweet.fox_news_search(params[:tweet])
		page = Nokogiri::HTML(open("http://t.co/XgWE1kD1Yc"))   
		puts "***********************************"
		puts page
		render json: tweets

	end


end
