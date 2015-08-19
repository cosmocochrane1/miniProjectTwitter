class SentimentsController < ApplicationController
	def search
		score = SENTIMENT.check_sentiment(params[:tweet])
		render json: score 
	end
end
