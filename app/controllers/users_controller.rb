class UsersController < ApplicationController

	before_filter :allowed_access?

	def index
		@users = User.all()
	end

	def show
		@user = User.find(params[:id])
	end

	protected
		def allowed_access?
			unless user_signed_in? && current_user.approved?
				respond_to do |format|
					format.html { render :text => "Not Allowed", :status => :forbidden }
				end
			end
		end
end
