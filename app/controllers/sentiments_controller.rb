class SentimentsController < ApplicationController

	def twittersearch
		tweets = Tweet.twitter_search(params[:tweet])
		render json: tweets

		Sentiment.check_sentiment(tweets)

	end


	def search
		score = Sentiment.check_sentiment(params[:tweet])
		render json: score 
	end
end
