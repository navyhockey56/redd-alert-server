class Api::V1::RedditController < ApplicationController

	def show
		render json: reddit_service.rising(params[:subreddit])
	end

	private

	def reddit_service
		@_reddit_service ||= RedditService.new(user)
	end

	def user
		@_user ||= User.first
	end
end
