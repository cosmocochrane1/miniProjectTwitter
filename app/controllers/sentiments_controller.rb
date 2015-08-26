require 'open-uri'         
class SentimentsController < ApplicationController

	def twittersearch
        allResults = []
        searchTerm = params[:term]

        #FOR TWITTER SEARCH
        tweets = Tweet.twitter_search(searchTerm)
        sent_array = Sentiment.check_sentiment_public(tweets)
        allResults.push(JSON.parse(sent_array.to_json))

        # FOR FOX SEARCH
		tweets = Tweet.fox_news_search(searchTerm) #returns an array of tweet objects form twitter
		body_text_array = Curated.fox_articles(tweets) #returns the array of text from the web scrape 
		article_scores = Sentiment.check_sentiment_fox(body_text_array) #this should return an array of percentages 
		allResults.push(JSON.parse(article_scores.to_json))


		binding.pry
        render json: allResults
	end

	#def fox_news
		#binding.pry
		#render json: results#returns the fox tweets 
	#end
end



