class UsersController < ApplicationController
	before_filter :signed_in_user, :only => [:new, :create]

	# authentication tsina|taobao
	def oauth
		@oa = request.env["omniauth.auth"]
		@auth = Authentication.find_by_provider_and_uid(@oa["provider"], @oa["uid"])
		unless @auth
			case @oa["provider"]
			when "taobao"
				@auth = TaobaoOauth.get_authentication(@oa) 
			when "tsina"
				@auth = SinaOauth.get_authentication(@oa)
			end
			@auth.save!
		end
		if !@auth.user_id.nil?
			redirect_to "/"
			return
		end
		redirect_to account_bind_path(:id=>@auth.id, :name=>@auth.user_name)
	end

	# GET:register new user
	def new
		@user = User.new	
	end

	# POST:save new user
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

	# GET:bind oauth user to ishow user
	def bind
		@user = User.new
		@auth = Authentication.find(params[:id])
		if @auth.user_name == params[:name]
			@user.name = params[:name]
			@user.email = @auth.email
		end
		@is_new_active = true
	end

	# POST:register user and bind oauth user
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

	# POST:bind oauth user to exist user
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
