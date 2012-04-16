#
require 'oauth/taobao_oauth'

class TradesController < ApplicationController
	# before_filter	:signed_in_user, :only => [:index]
	
	def index
		@user = current_user
		if @user.session.nil?
			flash[:notice] = "please bind taobao"
			return
		end

		Trade.sync_trades(provider("taobao"), @user.id, @user.session)
		
		
		@trades = Trade.where(:user_id => @user.id).paginate(:page=>params[:page], :per_page=>15)
	end
end
