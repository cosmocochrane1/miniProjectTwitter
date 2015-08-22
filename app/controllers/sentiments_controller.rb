class SentimentsController < ApplicationController

	def twittersearch
		todays_date = Tweet.date_finder(168)
		tweets1 = Tweet.twitter_search(params[:tweet], todays_date - (144/24))
		tweets2 = Tweet.twitter_search(params[:tweet], todays_date - (120/24))
		tweets3 = Tweet.twitter_search(params[:tweet], todays_date - (96/24))
		tweets4 = Tweet.twitter_search(params[:tweet], todays_date - (72/24))
		tweets5 = Tweet.twitter_search(params[:tweet], todays_date - (48/24))
		tweets6 = Tweet.twitter_search(params[:tweet], todays_date - (24/24))
		tweets7 = Tweet.twitter_search(params[:tweet], todays_date)


		render json: tweets
		Sentiment.check_sentiment(tweets)
		

	end


	def search
		data_set = 
		score = Sentiment.check_sentiment(params[:tweet])
		score 
	end
end
