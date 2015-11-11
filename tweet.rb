class Tweet 
	require "httparty"

	def self.search(handler)
		base_url = "https://api.twitter.com/1.1/search/tweets.json"
		
		data_response = HTTParty.get ("#{base_url}q=%23#{handler}&since_id=#{since_id}&max_id=")

		tweet_text = data_response
		sentiment_response = HTTParty.get ("https://www.tweetsentimentapi.com/api/?key=f96b60fbda0c227488d4544ff70d02297f0f775c&text= #{tweet_text}")
	end

end
