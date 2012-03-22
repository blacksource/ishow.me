class UsersController < ApplicationController
	def new
		@user = User.new()	
	end

	def create
		@user = User.new(params[:user])
		@user.last_login_ip = request.remote_ip
		@user.last_login_at = Time.now
		if @user.save
			redirect_to "/"
		else
			render "new"
		end
	end
end
