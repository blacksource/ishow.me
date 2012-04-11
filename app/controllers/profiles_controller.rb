class ProfilesController < ApplicationController
	def edit_userinfo
		@user = User.find(params[:id])	
	end
end
