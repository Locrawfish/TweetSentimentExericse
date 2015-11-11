class Tweet 
	require "httparty"

	def self.search(handler)
		base_url = "https://api.twitter.com/1.1/search/tweets.json"

		HTTParty.get ("#{base_url}?q=%40#{handler}")
	end

end
