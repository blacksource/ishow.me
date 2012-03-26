class SessionsController < ApplicationController
	def create
		oa = request.env["omniauth.auth"]
		@auth = Authentication.find_by_provider_and_uid(oa["provider"], oa["uid"])
		@auth = @auth || Authentication.create_by_oauth(oa)
		if @auth.user_id
			redirect_to "/"
		end
		redirect_to account_bind_path(:id=>@auth.id, :name=>@auth.user_name)

		# if @auth == nil
		# 	@auth = Authentication.new(:provider=>oa["provider"], :uid=>oa["uid"],
		# 			:oauth_token=>oa["credentials"]["token"], :oauth_token_secret=>oa["credentials"]["secret"],
		# 			:user_name=>oa["user_info"]["username"], :image=>oa["user_info"]["image"])
		# 	if !@auth.save
		# 		flash[:notice] = "error===="
		# 		redirect_to register_path
		# 	end
		# else
		# 	if @auth.user_id
		# 		redirect_to root_path
		# 	end			
		# end
		
	end
end
