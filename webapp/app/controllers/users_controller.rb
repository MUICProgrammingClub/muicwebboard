class UsersController < ApplicationController
	load_and_authorize_resource
	def show
		@user_role = UserRole.find(current_user)
		@user = User.find(params[:id])
		@lectures_admin = Lecture.search "*", where:{approve: [nil, false], user_id: @user.id}, page: params[:page], per_page: 20
	end
end
