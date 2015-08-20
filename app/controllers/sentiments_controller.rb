class SentimentsController < ApplicationController

	def twittersearch
		tweets = TWEET.twitter_search(params[:tweet])
		render json: tweets

		# SENTIMENT.check_sentiment(tweets)

	end


	def search
		score = SENTIMENT.check_sentiment(params[:tweet])
		render json: score 
	end
end
