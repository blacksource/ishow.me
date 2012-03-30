require "oauth/taobao_oauth.rb"
require "oauth/sina_oauth.rb"

class SessionsController < ApplicationController
	before_filter :signed_in_user, :only => [:new, :create]

	# GET:login
	def new
		@user = User.new
	end

	# POST:login
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
			sign_in(user_db)
			redirect_to root_path
		end
	end

	def destroy
		sign_out
    	redirect_to root_path
	end
end
