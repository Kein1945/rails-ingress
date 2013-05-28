class UsersController < ApplicationController
#	load_and_authorize_resource

	def index
		@users = User.all()
		authorize! :manage, User
	end

	def show
		@user = User.find(params[:id])
		authorize! :read, @user
	end
end
