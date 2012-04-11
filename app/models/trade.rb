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
end
