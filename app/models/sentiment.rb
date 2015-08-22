require 'sentimental'

class Sentiment 
	# Load the default sentiment dictionaries
	Sentimental.load_defaults
	Sentimental.threshold = 0.0

	def self.check_sentiment(array)
		array_of_average_scores = []
		sentiment_scores = []

		array.each do |list_of_tweets|
			list_of_tweets.each do |individual_tweet| 
				puts individual_tweet.class
				analyzer = Sentimental.new
				score = analyzer.get_score(individual_tweet[:text])
				sentiment_scores.push(score)
			end
			average_sentiment = sentiment_scores.inject{ |sum, value| sum + value }.to_f / sentiment_scores.size
			array_of_average_scores.push(average_sentiment)
		end
		puts array_of_average_scores
	end



end
