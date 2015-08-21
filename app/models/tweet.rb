# require 'config/initializers/twitter.rb'

class Tweet 

	def self.twitter_search(word, start_date, end_date)

		client = Twitter::REST::Client.new do |config|
		  config.consumer_key         = ENV['CONSUMER_KEY']
		  config.consumer_secret      = ENV['CONSUMER_SECRET']
		  config.access_token         = ENV['YOUR_ACCESS_TOKEN']
		  config.access_token_secret  = ENV['YOUR_ACCESS_SECRET']
		end 
# - 3 weeks, and then -2 weeks, -1 week
   		# client.get('https://twitter.com/search?q='+ word +'%20until%3A'+ start_date +'%' + word + '%20since%3Aend_date&src=typd')[:statuses]
   		client.get('https://api.twitter.com/1.1/search/tweets.json?q=' + word + '&until=' + todays_date)[:statuses]
	end

	def self.date_finder(hours) 
	
		todays_date = DateTime.now 
		todays_date = todays_date.to_s
		todays_date = todays_date - (hours/24)
		todays_date = todays_date[0..9]
		hours =- 24

	end



end