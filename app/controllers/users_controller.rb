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
		@auth = Authentication.find(params[:id])
		if @auth.user_name == params[:name]
			@user.name = params[:name]
			@user.email = @auth.email
		end
		@is_new_active = true
	end

	def bind_new
		@user = User.new(params[:user])
		aid = params[:authentication][:id]

		@auth = Authentication.find(aid)
		if @auth && @auth.user_id.blank?
			if @user.valid?
				@user.save!
				#update current created user_id to Authentication.user_id
				@auth.user_id = @user.id
				@auth.save!
				redirect_to "/"
			else
				@is_new_active = true
				render :action => "bind"
				return
			end	
		end
	end

	def bind_exist
		@user = User.new(params[:user])
		aid = params[:authentication][:id]

		@auth = Authentication.find(aid)
		# auth has binded to user
		if !@auth.user_id.nil?
			redirect_to "/"
			return
		end
		# check user`s email and password
		user_db = @user.authentication
		if user_db.nil?
			flash[:notice] = "邮箱不存在!"
			render "bind"
		elsif user_db.password_digest.nil?
			flash[:notice] = "密码不正确!"
			render "bind"
		else
			#bind auth to user
			@auth.user_id = user_db.id
			@auth.save!
			redirect_to "/"
		end
	end
end
