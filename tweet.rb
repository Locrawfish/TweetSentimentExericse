require "httparty"
class Tweet 
	

	def self.search(search_text)
		search_result = HTTParty.get "https://api.twitter.com/1.1/search/tweets.json?q=#{search_text}", :headers =>{"Authorization"=>"Bearer AAAAAAAAAAAAAAAAAAAAALaMigAAAAAAWn5FCNWFWcMCqnB%2FPfUgmUqNzNU%3DQXOykvCCGD4picjpP0PCTrb4sW6tM78EWFRx2gZXYCL2bRNdqy"}

		tweet_text = search_result.parsed_response["statuses"].map {|tweet| tweet["text"]}
		return tweet_text

		# sentiment_response = HTTParty.get ("https://www.tweetsentimentapi.com/api/?key=f96b60fbda0c227488d4544ff70d02297f0f775c&text=#{tweet_text}")
	end

end


puts "What twitter handle do you want to search for?"
 
search_text = gets.chomp 

puts Tweet.search(search_text)
