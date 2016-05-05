class UsersController < ApplicationController
	load_and_authorize_resource
	def show
		@user_role = UserRole.find(current_user)
		@user = User.find(params[:id])
	end
end
