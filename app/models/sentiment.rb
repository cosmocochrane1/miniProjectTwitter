require 'sentimental'

class Sentiment 
	# Load the default sentiment dictionaries
	Sentimental.load_defaults
	Sentimental.threshold = 0.0

	def check_sentiment(term)
		analyzer = Sentimental.new
		score = analyzer.get_score term
		return score
	end
end
