# require 'config/initializers/twitter.rb'

class Tweet 

    
    def self.twitter_search(word)

        client = Twitter::REST::Client.new do |config|
          config.consumer_key         = ENV['CONSUMER_KEY']
          config.consumer_secret      = ENV['CONSUMER_SECRET']
          config.access_token         = ENV['YOUR_ACCESS_TOKEN']
          config.access_token_secret  = ENV['YOUR_ACCESS_SECRET']
        end 
        # - 3 weeks, and then -2 weeks, -1 week
           # client.get('https://twitter.com/search?q='+ word +'%20until%3A'+ start_date +'%' + word + '%20since%3Aend_date&src=typd')[:statuses]
        array_of_tweet_objects = []
        days = 7

        7.times do |object| 
         todays_date = DateTime.now 
         todays_date = todays_date - days
         todays_date = todays_date.to_s
         todays_date = todays_date[0..9] #takes first 9 characters of the string

         api_tweet_response = client.get('https://api.twitter.com/1.1/search/tweets.json?q=' + word + '&until=' + todays_date + '&lang=en&result_type=popular')[:statuses]
         array_of_tweet_objects.push(api_tweet_response)
         days -= 1
        end

        return array_of_tweet_objects
    end

    def self.fox_news_search(word)

      client = Twitter::REST::Client.new do |config|
          config.consumer_key         = ENV['CONSUMER_KEY']
          config.consumer_secret      = ENV['CONSUMER_SECRET']
          config.access_token         = ENV['YOUR_ACCESS_TOKEN']
          config.access_token_secret  = ENV['YOUR_ACCESS_SECRET']
        end 


        array_of_tweet_objects = []
        days = 7

        7.times do |object|
           todays_date = DateTime.now 
           todays_date = todays_date - days
           todays_date = todays_date.to_s
           todays_date = todays_date[0..9] #takes first 9 characters of the string
           api_tweet_response = client.get('https://api.twitter.com/1.1/search/tweets.json?q=' + word + '%20from:FoxNews&until='+ todays_date + '&lang=en&result_type=popular')[:statuses]
           array_of_tweet_objects.push(api_tweet_response)
           puts "***********************"
           days -= 1   
        end

        return array_of_tweet_objects
    end


end