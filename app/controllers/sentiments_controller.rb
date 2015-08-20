class SentimentsController < ApplicationController

	def twittersearch
		tweets = Twitter.twitter_search(params[:tweet])
		SENTIMENT.check_sentiment(tweets)

	end


	def search
		score = SENTIMENT.check_sentiment(params[:tweet])
		render json: score 
	end
end
