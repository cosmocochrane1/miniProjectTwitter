class SentimentsController < ApplicationController

	def twittersearch
		#binding.pry
		tweets = Tweet.twitter_search(params[:tweet])
		render json: tweets
		Sentiment.check_sentiment(tweets)
	end

end
