require 'sentimental'

class Sentiment
  # Load the default sentiment dictionaries
	Sentimental.load_defaults
	Sentimental.threshold = 0.0

	def self.percentage_finder(array_of_average_scores)
    	
       #array_of_average_scores.insert(0,0) #adds 0 as a value to the beginning of hte array
       percentage_change_array = []
       i = 0
       while i < array_of_average_scores.length - 1 do
           difference = array_of_average_scores[i + 1] - array_of_average_scores[i]
           percent_change = (difference/array_of_average_scores[i])*100
           percentage_change_array.push(percent_change)
           i += 1
         end
         return percentage_change_array
  	end

      def self.liberal_percentage_finder(array_of_average_scores)
      
       #array_of_average_scores.insert(0,0) #adds 0 as a value to the beginning of hte array
       percentage_change_array = []
       i = 0
       while i < array_of_average_scores.length - 1 do
           difference = array_of_average_scores[i + 1] - array_of_average_scores[i]
           percent_change = (difference/array_of_average_scores[i])*1
           percentage_change_array.push(percent_change)
           i += 1
         end
         return percentage_change_array
    end

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
    	self.percentage_finder(array_of_average_scores) #calls the percetage finder function above

    end
    	
    def self.check_sentiment_curated(array)
    	array_of_average_scores = []
    
    	array.each do |individual_article|
	    	day_sentiment_scores = []
    		
    		individual_article.each do |one_tweet|
        		analyzer = Sentimental.new
        		score = analyzer.get_score(one_tweet)
        		day_sentiment_scores.push(score)
        	end
        	average_sentiment = day_sentiment_scores.inject{ |sum, value| sum + value }.to_f / day_sentiment_scores.size
        	array_of_average_scores.push(average_sentiment)
      		puts array_of_average_scores
    	end
    	puts array_of_average_scores

    	self.percentage_finder(array_of_average_scores) #calls the percetage finder function above
    end 


        def self.liberal_check_sentiment_curated(array)
      array_of_average_scores = []
    
      array.each do |individual_article|
        day_sentiment_scores = []
        
        individual_article.each do |one_tweet|
            analyzer = Sentimental.new
            score = analyzer.get_score(one_tweet)
            day_sentiment_scores.push(score)
          end
          average_sentiment = day_sentiment_scores.inject{ |sum, value| sum + value }.to_f / day_sentiment_scores.size
          array_of_average_scores.push(average_sentiment)
          puts array_of_average_scores
      end
      puts array_of_average_scores

      self.liberal_percentage_finder(array_of_average_scores) #calls the percetage finder function above
    end 
end
