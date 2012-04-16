module SessionsHelper
	def sign_in(user)
		cookies.permanent[:user_id] = user.id
		current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user?(user)
		@current_user != user
	end

	def current_user
		@current_user ||= user_from_cookie
	end

	def user_from_cookie
		user_id = cookies[:user_id]
		if user_id
			# User.find(cookies[:user_id])
			@current_user = User.find(cookies[:user_id])
			taobao_auth = @current_user.authentications.where(:provider=>"taobao").first;
			if !taobao_auth.nil?
				@current_user.session = taobao_auth.oauth_token
			end
			return @current_user
		end
	end

	def sign_out
		current_user = nil
		cookies.delete(:user_id)
	end

	def signed_in_user
    	# redirect_to root_path unless !signed_in?
    	if !signed_in?
    		redirect_to login_path
    	end
  	end

  	def providers
  		@providers ||= Provider.all
  	end

  	def provider(name)
  		providers.each do |p|
  			if p.provider_name == name
  				return p
  			end
  		end
  	end
end
