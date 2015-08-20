require 'sentimental'

class SENTIMENT 
	# Load the default sentiment dictionaries
	Sentimental.load_defaults
	Sentimental.threshold = 0.0

	def self.check_sentiment(array)
		sentiment_scores = []

		array.each do |tweet| tweet.text
			analyzer = Sentimental.new
			score = analyzer.get_score(tweet.text)
			sentiment_scores.push(score)
		end
		
		average_sentiment = sentiment_scores.inject{ |sum, value| sum + value }.to_f / sentiment_scores.size
		return average_sentiment 

	end
end
