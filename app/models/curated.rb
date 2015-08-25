# at the end of parsing thru the JSON object returned by one day's twitter call,
# (iterate over an each loop of JSON results and do this function)
# nyt_array_of_article_text will be full of strings that can be sent to 
# sentiment checker / find average of all sentiments of all of today's articles
require 'open-uri'
class Curated
	#for one day's twitter articles

	#for FOX
	def self.fox_articles(foxJSON)
		fox_array_of_article_text = []
		foxJSON.each do |list_of_tweets|
			list_of_tweets.each do |one_tweet|
				article_URI = one_tweet.entities.urls.url
				if (article_URI != nil)
					page = Nokogiri::HTML(open(article_URI))
					fox_content = page.css('div#content')
					fox_content.join(" ")
					fox_array_of_article_text.push(fox_content)
				end
			end
		end
		return fox_array_of_article_text
	end

	#FOR NYT
	def self.nyt_articles(nytJSON)
		nyt_array_of_article_text = []
		nytJSON.each do |list_of_tweets|
			list_of_tweets.each do |one_tweet|
				article_URI = one_tweet.entities.urls.url
				if (article_URI != nil)
					page = Nokogiri::HTML(open(article_URI))
					nyt_content = page.css('p.story-body-text')
					nyt_content.join(" ")
					nyt_array_of_article_text.push(nyt_content)
				end
			end
		end
		return nyt_array_of_article_text
	end

	#FOR GUARDIAN
	def self.guardian_articles(guardianJSON)
		guardian_array_of_article_text = []
		guardianJSON.each do |list_of_tweets|
			list_of_tweets.each do |one_tweet|
				article_URI = one_tweet.entities.urls.url
				if (article_URI != nil)
					page = Nokogiri::HTML(open(article_URI))
					guardian_content = page.css('div.content__article-body p')
					guardian_content.join(" ")
					guardian_array_of_article_text.push(guardian_content)
				end
			end
		end
		return guardian_array_of_article_text
	end

	#FOR BLAZE
	def self.blaze_articles(blazeJSON)
		blaze_array_of_article_text = []
		blazeJSON.each do |list_of_tweets|
			list_of_tweets.each do|one_tweet|
				article_URI = one_tweet.entities.urls.url
				if (article_URI != nil)
					page = Nokogiri::HTML(open(article_URI))
					blaze_content = page.css('div#postContent')
					blaze_content.join(" ")
					blaze_array_of_article_text.push(blaze_content)
				end
			end
		end
		return blaze_array_of_article_text
	end

end




