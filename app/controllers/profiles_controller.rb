class ProfilesController < ApplicationController
	before_filter :signed_in_user, :only => [:edit_userinfo]

	def edit_userinfo
		@user = current_user
	end
end
