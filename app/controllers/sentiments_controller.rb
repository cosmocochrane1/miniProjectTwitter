class sentiment < ApplicationController
def search
	sentiment = Sentiment.sentiment_analyzer(term)
	
end



end
