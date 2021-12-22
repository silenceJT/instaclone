class FriendRequestsController < ApplicationController
	def index
		@friend_requests = current_user.requested_friends
	end

	def create
		user = User.find(params[:user_id])
		current_user.friend_request(user)

		redirect_to profiles_path, notice: "Request sent to #{user.username}"
	end

	def accept
		user = User.find(params[:friend_request_id])
		current_user.accept_request(user)

		redirect_to profiles_path, notice: "Accepted request from #{user.username}"
	end

	def accept
		user = User.find(params[:friend_request_id])
		current_user.decline_request(user)

		redirect_to profiles_path, notice: "Declined request from #{user.username}"
	end

end
