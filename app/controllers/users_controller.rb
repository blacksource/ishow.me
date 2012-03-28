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
			@user.save!
			#update current created user_id to Authentication.user_id
			@auth.user_id = @user.id
			@auth.save!
			redirect_to "/"
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
			render :action => "bind", :user=>@user, :auth=>@auth
		# elseif @user.password_digest.nil?
		# 	flash[:notice] = "密码不正确!"
		# 	render :partial => "bind_exist", :user=>@user, :auth=>@auth
		else
			#bind auth to user
			@auth.user_id = user_db.id
			@auth.save!
			redirect_to "/"
		end
	end
end
