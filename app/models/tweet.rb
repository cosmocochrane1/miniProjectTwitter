# require 'config/initializers/twitter.rb'

class Tweet 

	def self.twitter_search(word)

		client = Twitter::REST::Client.new do |config|
		  config.consumer_key         = ENV['CONSUMER_KEY']
		  config.consumer_secret      = ENV['CONSUMER_SECRET']
		  config.access_token         = ENV['YOUR_ACCESS_TOKEN']
		  config.access_token_secret  = ENV['YOUR_ACCESS_SECRET']
		end 

   		client.get('https://api.twitter.com/1.1/search/tweets.json?q=' + word)[:statuses]

	end


end