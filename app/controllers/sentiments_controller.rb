class SentimentsController < ApplicationController

	def twittersearch
		tweets = Tweet.twitter_search(params[:tweet])

		render json: tweets
		Sentiment.check_sentiment(tweets)
		

	end


	def search
		data_set = 
		score = Sentiment.check_sentiment(params[:tweet])
		score 
	end
end
