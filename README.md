# miniProjectTwitter

testing hi cosmo-

//////////////////////////////////////////

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

//////////////////////////////////////////

<form action='/signup' method="POST">
	<input type="text" name="tweet" placeholder="enter search term"><br>
	<p>Start Date: <input type="text" class="datepicker" id="startDate"></p>
	<p>End Date: <input type="text" class="datepicker" id="endDate"></p>
	<button>search</button><br>
</form>



<%= form_tag("/search", method: "post") do %>
	<%= text_field_tag("tweet") %>
	<%= datepicker_input "twitter", "startDate" %>
	<%= datepicker_input "twitter", "endDate" %>
	<%= submit_tag("submit")%>
<% end %>