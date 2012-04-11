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
			User.find(cookies[:user_id])
			# @current_user = User.find(cookies[:user_id])
			# @current_user.auths = @current_user.authentications
			# return @current_user
		end
	end

	def sign_out
		current_user = nil
		cookies.delete(:user_id)
	end

	def signed_in_user
    	redirect_to root_path unless !signed_in?
  	end
end
