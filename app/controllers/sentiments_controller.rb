class sentiment < ApplicationController
def search
	score = Sentiment.sentiment_analyzer(params[:tweet])
	render json: score 
end



end
