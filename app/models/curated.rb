
# at the end of parsing thru the JSON object returned by one day's twitter call,
# (iterate over an each loop of JSON results and do this function)
# nyt_array_of_article_text will be full of strings that can be sent to 
# sentiment checker / find average of all sentiments of all of today's articles
require 'open-uri'
class Curated
	#for one day's twitter articles

	def self.fox_articles(foxJSON)
		fox_week_array = []

		foxJSON.each do |one_tweet|
			fox_day_array = []
			one_tweet.each do |single_tweet|
				if single_tweet.length > 0  
					if single_tweet[:entities][:urls].length > 0
						article_URI = single_tweet[:entities][:urls][0][:url]
						puts article_URI
						page = Nokogiri::HTML(open(article_URI))
						fox_content = page.css('div[itemprop="articleBody"] p')
						fox_day_array.push(fox_content.to_s)
					else 
						puts "FAIL POINT ONE"
					end
				else
					puts "FAIL POINT TWO"
				end
			end
			fox_week_array.push(fox_day_array)
		end
		return fox_week_array
	end

	#FOR GUARDIAN
	def self.guardian_articles(guardianJSON)
		fox_week_array = []

		guardianJSON.each do |one_tweet|
			guardian_day_array = []
			one_tweet.each do |single_tweet|
				if single_tweet.length > 0  
					if single_tweet[:entities][:urls].length > 0
						article_URI = single_tweet[:entities][:urls][0][:url]
						puts article_URI
						page = Nokogiri::HTML(open(article_URI))
						guardian_content = page.css('div.content__article-body p')
						guardian_day_array.push(guardian_content.to_s)
					else 
						puts "FAIL POINT 2-ONE"
					end
				else
					puts "FAIL POINT 2-TWO"
				end
			end
			guardian_week_array.push(guardian_day_array)
		end
		return guardian_week_array
	end

end









