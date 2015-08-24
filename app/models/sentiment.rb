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
		binding.pry
	end

	# [0.26444444444446663, 0.26057997557999996, 0.21464896214897777, 0.11160530237734999, 0.07321372908137332, 0.1180980811127889, 0.07898691955415237]


end

array_of_average_scores.insert(0,0)

for (var i = 0;i<array_of_average_scores.lenght;i++) {
	var difference = array_of_average_scores[i] - array_of_average_scores[i-1];
	var percentage = difference/array_of_average_scores[i]
}
end







