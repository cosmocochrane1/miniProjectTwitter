class SentimentsController < ApplicationController

	def twittersearch
		todays_date = Tweet.date_finder(168)
		tweets = Tweet.twitter_search(params[:tweet], todays_date)
		render json: tweets
		Sentiment.check_sentiment(tweets)
		

	end


	def search
		data_set = 
		score = Sentiment.check_sentiment(params[:tweet])
		score 
	end
end
