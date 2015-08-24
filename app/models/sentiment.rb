require 'sentimental'

class Sentiment
  # Load the default sentiment dictionaries
	Sentimental.load_defaults
	Sentimental.threshold = 0.0

  	def self.check_sentiment_public(array)
    	array_of_average_scores = []
    	sentiment_scores = []

    	array.each do |list_of_tweets|
      		list_of_tweets.each do |individual_tweet|
        		analyzer = Sentimental.new
        		score = analyzer.get_score(individual_tweet[:text])
        		sentiment_scores.push(score)
      		end
      		average_sentiment = sentiment_scores.inject{ |sum, value| sum + value }.to_f / sentiment_scores.size
      		array_of_average_scores.push(average_sentiment)
      		# puts array_of_average_scores
    	end

    	array_of_average_scores.insert(0,0) #adds 0 as a value to the beginning of hte array
    	percentage_change_array = []
    	# i = 0
    	# x = i+1
    	# while i < array_of_average_scores.length - 1 do
     #    	difference = array_of_average_scores[x] - array_of_average_scores[i]
     #    	percent_change = (difference/array_of_average_scores[x])*100
     #    	percentage_change_array.push(percent_change)
     #    	i++
    	#end
    	#puts (percentage_change_array)
    	i = 1
    	array_of_average_scores.each_with_index{|item, i|
    		difference = array_of_average_scores[i] - item
    		percent_change = (difference/array_of_average_scores[i])*100
    		percentage_change_array.push(percent_change)
    		i++
    	}
  	end
  	puts (percentage_change_array)
end

  # [0.26444444444446663, 0.26057997557999996, 0.21464896214897777, 0.11160530237734999, 0.07321372908137332, 0.1180980811127889, 0.07898691955415237]






