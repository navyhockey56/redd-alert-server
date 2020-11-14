class RedditService
	attr_reader :user

	def initialize(user)
		@user = user
	end

	def rising(subreddit_name)
		subreddit(subreddit_name).rising.entries.map do |submission|
			{
				title: submission.title,
				author: submission.author_fullname,
				text: submission.selftext,
				thumbnail: submission.thumbnail,
				url: submission.url
			}
		end
	end

	def subreddit(subreddit_name)
		client.subreddit(subreddit_name)
	end

	private

	def client
		@_client ||= Redd.it(
		  user_agent: REDDIT_USER_AGENT,
		  client_id:  REDDIT_CLIENT_ID,
		  secret:     REDDIT_CLIENT_SECRET,
		  username:   user.username,
		  password:   user.password
		)
	end
end
