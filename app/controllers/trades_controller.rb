#
require 'oauth/taobao_oauth'

class TradesController < ApplicationController
	# before_filter	:signed_in_user, :only => [:index]
	
	def index
		@user = current_user
		auths = @user.authentications.where(:provider=>"taobao")
		if auths.length == 0
			return
		end
		@auth = auths[0]

		if params[:page].nil?
			last_trade_date = Trade.get_last_trade_date(@user.id)
			# get trades from taobao
			taobao = TaobaoOauth.new("12584221","d60014ad428681e2e7e2be3ef7eb9705")
			params = {'session' => @auth.oauth_token, 'start_created' => last_trade_date.strftime('%Y-%m-%d %H:%M:%S')}
			@trades = taobao.get_trades_bought(params)
			@trades = JSON.parse(@trades)["trades_bought_get_response"]["trades"]
			if !@trades.nil?
				@trades["trade"].each do |trade|
					current_trade = Trade.create(:tid => trade["tid"], :price => trade["price"], :created => trade["created"],
					:seller_nick => trade["seller_nick"], :commission_fee => trade["commission_fee"], 
					:receiver_name => trade["receiver_name"], :receiver_mobile => trade["receiver_mobile"], :receiver_phone => trade["receiver_phone"],
					:receiver_state => trade["receiver_state"], :receiver_city => trade["receiver_city"], :receiver_district => trade["receiver_district"],
					:receiver_address => trade["receiver_address"], :receiver_zip => trade["receiver_zip"], :user_id => @user.id)
					trade["orders"]["order"].each do |order|
						Order.create(:oid => order["oid"], :title => order["title"], :num_iid => order["num_iid"],
						:num => order["num"], :price => order["price"], :total_fee => order["total_fee"],
						:pic_path => order["pic_path"], :trade_id => current_trade.id)
					end
				end
			end
		end
		@trades = Trade.where(:user_id => @user.id).paginate(:page=>params[:page], :per_page=>15)
	end
end
