require "oauth/taobao_oauth.rb"
require "oauth/sina_oauth.rb"

class SessionsController < ApplicationController
	def create
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
end
