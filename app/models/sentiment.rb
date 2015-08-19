class Sentiment 

	# Load the default sentiment dictionaries
Sentimental.load_defaults

Sentimental.threshold = 0.1

def sentiment_analyzer(phrase)
	analyzer = Sentimental.new
	analyzer.get_sentiment phrase 
end





end
