require 'open-uri'
class SentimentsController < ApplicationController

	def twittersearch
		#binding.pry
		tweets = Tweet.twitter_search(params[:tweet])
		render json: tweets
		Sentiment.check_sentiment(tweets)
		page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
		puts "***********************************"
		puts page
	end

	def fox_news
		tweets = Tweet.fox_news_search(params[:tweet])
		render json: tweets

	end


end
