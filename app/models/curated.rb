require 'open-uri'
class Curated
	#for one day's twitter articles
	def self.fox_articles(foxJSON)
		fox_array_of_article_text = []
		foxJSON.each do |one_tweet|
			article_URI = one_tweet.entities.urls.url
			page = Nokogiri::HTML(open(article_URI))
			fox_content = page.css('div#content')
			fox_content.join(" ")
			fox_array_of_article_text.push(fox_content)
		end
		return fox_array_of_article_text
	end
end




# at the end of parsing thru the JSON object returned by one day's twitter call,
# (iterate over an each loop of JSON results and do this function)
# nyt_array_of_article_text will be full of strings that can be sent to 
# sentiment checker / find average of all sentiments of all of today's articles
