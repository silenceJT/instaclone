class FriendsController < ApplicationController
	def show
		@user = User.find_by(username: params[:username])
	end
end
