require 'open-uri'
class SentimentsController < ApplicationController

	def twittersearch
		tweets = Tweet.twitter_search(params[:term])
		sent_array = Sentiment.check_sentiment_public(tweets)
		results = JSON.parse(sent_array.to_json)
		render json: results
	end

	def fox_news
        tweets = Tweet.fox_news_search(params[:tweet]) 
        body_text_array = Curated.fox_articles(tweets) #returns the array of text from the web scrape 
        article_scores = Sentiment.check_sentiment_fox(body_text_array) #this should return an array of percentages 
        render json: tweets #returns the fox tweets 
    end



end
