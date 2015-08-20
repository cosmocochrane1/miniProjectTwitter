class Twitter < ActiverRecord::Base

	def self.twitter_search(start_date, end_date, word)

		require 'twitter'

		client = Twitter::REST::Client.new do |config|
		  config.consumer_key         = ENV['CONSUMER_KEY']
		  config.consumer_secret      = ENV['CONSUMER_SECRET']
		  config.access_token         = ENV['YOUR_ACCESS_TOKEN']
		  config.access_token_secret  = ENV['YOUR_ACCESS_SECRET']
		end 


    client.get('https://twitter.com/search.json?q=flight%20%3A%28&src=typd')

	end



end