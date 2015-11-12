require "httparty"
class Tweet 
	

	def self.search(search_text)
		search_result = HTTParty.get "https://api.twitter.com/1.1/search/tweets.json?q=#{search_text}", :headers =>{"Authorization"=>"Bearer AAAAAAAAAAAAAAAAAAAAALaMigAAAAAAWn5FCNWFWcMCqnB%2FPfUgmUqNzNU%3DQXOykvCCGD4picjpP0PCTrb4sW6tM78EWFRx2gZXYCL2bRNdqy"}

		tweet_text = search_result.parsed_response["statuses"].map {|tweet| tweet["text"]}
		
		sentiment_text = tweet_text.map {|text| URI.escape(text, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}

		sentiment_response = sentiment_text.map {|text| HTTParty.get ("https://www.tweetsentimentapi.com/api/?key=f96b60fbda0c227488d4544ff70d02297f0f775c&text=#{text}")}
		if sentiment_response[0] = "positive"
			print tweet_text 
		end
		
	end

end

puts "Who's your promoter on twitter? Input your handle to find out."

search_text = gets.chomp 

puts Tweet.search(search_text)
