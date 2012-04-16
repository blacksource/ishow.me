require 'oauth/taobao_oauth'

class Trade < ActiveRecord::Base
	has_many :orders
		
	def self.get_last_trade_date(user_id)
		last_trade = Trade.where(:user_id=>user_id).order("created DESC").first
		if !last_trade
			Time.now - 3.month
		else
			last_trade.created + 5.second
		end
	end

	def self.sync_trades(provider, user_id, session)
		last_trade_date = Trade.get_last_trade_date(user_id)
		# get trades from taobao
		taobao = TaobaoOauth.new(provider.app_key, provider.app_secret)
		params = {'session' => session, 'start_created' => last_trade_date.strftime('%Y-%m-%d %H:%M:%S')}
		@trades = taobao.get_trades_bought(params)
		if !@trades.nil?
			@trades["trade"].each do |trade|
				current_trade = Trade.create(:tid => trade["tid"], :price => trade["price"], :created => trade["created"],
				:seller_nick => trade["seller_nick"], :commission_fee => trade["commission_fee"], 
				:receiver_name => trade["receiver_name"], :receiver_mobile => trade["receiver_mobile"], :receiver_phone => trade["receiver_phone"],
				:receiver_state => trade["receiver_state"], :receiver_city => trade["receiver_city"], :receiver_district => trade["receiver_district"],
				:receiver_address => trade["receiver_address"], :receiver_zip => trade["receiver_zip"], :user_id => user_id)
				trade["orders"]["order"].each do |order|
					Order.create(:oid => order["oid"], :title => order["title"], :num_iid => order["num_iid"],
					:num => order["num"], :price => order["price"], :total_fee => order["total_fee"],
					:pic_path => order["pic_path"], :trade_id => current_trade.id)
				end
			end
		end
	end

	def self.have_bought(user_id, num_iid)
		Trade.joins(:orders).where("user_id = ? AND num_iid= ?", user_id, num_iid).count > 0
	end
end
