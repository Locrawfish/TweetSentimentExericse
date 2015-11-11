class TweetsController
	require "httparty"

	def search
		@search_text = search_params[:q] || ""
		@search_results = Tweet.search(@search_text) unless @search_text.empty?
		
	end

	def index
		@tweets = []
		
	end

	def get_positive_sentiment(search_result)
		
	end
end
