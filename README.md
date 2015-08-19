# miniProjectTwitter

testing hi cosmo-



require 'sentimental'

Sentimental.load_defaults
Sentimental.threshold = 0.1

def check_sentiment(term)
	analyzer = Sentimental.new
	puts analyzer.get_sentiment term
	puts analyzer.get_score term
end


check_sentiment("Hey What's up")
check_sentiment("I LOVE YOU")
check_sentiment("this is so fucked up")
check_sentiment("good")