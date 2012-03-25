class UsersController < ApplicationController
	def new
		@user = User.new	
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

	def bind
		@user = User.new
		@authentication = Authentication.find(params[:id])
		if @authentication.user_name == params[:name]
			@user.name = params[:name]
		end			
	end

	def bind_new
		@user = User.new(params[:user])
		aid = params[:authentication][:id]

		authentication = Authentication.find(aid)
		if authentication && authentication.user_name == @user.name
			# save user info
			if @user.save
				authentication.user_id = @user.id
				authentication.save
				redirect_to "/"
			end
		end

		@authentication = Authentication.new(params[:authentication])
	end

	def bind_existed
	end
end
