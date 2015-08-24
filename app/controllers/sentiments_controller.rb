class SentimentsController < ApplicationController

	def twittersearch
		#binding.pry
		tweets = Tweet.twitter_search(params[:tweet])
		render json: tweets
		Sentiment.check_sentiment(tweets)
	end

	def fox_news
		tweets = Tweet.fox_news_search(params[:tweet])
		render json: tweets

	end


end
