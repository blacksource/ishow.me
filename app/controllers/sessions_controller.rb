require "oauth/taobao_oauth.rb"
require "oauth/sina_oauth.rb"

class SessionsController < ApplicationController
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

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		user_db = @user.authentication
		if user_db.nil?
			flash[:notice] = "邮箱不存在!"
			render "new"
		elsif user_db.password_digest.nil?
			flash[:notice] = "密码不正确!"
			render "new"
		else
			sign_in(@user)
			redirect_to "/"
		end
	end

	def destroy
	end
end
