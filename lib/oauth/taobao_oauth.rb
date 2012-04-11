require 'md5'
require 'rest_client'

class TaobaoOauth
	
	def initialize(app_key, app_secret)
		@secret = app_secret
		@url = 'http://gw.api.taobao.com/router/rest?'  
		@params = {
			'app_key' => app_key,
			'format'=> 'json',
			'v' => '2.0',
			'timestamp' => Time.new().strftime("%Y-%m-%d %H:%M:%S"),
			'page_size' => '100'
		}
	end

	def sign(params, secret_code)  
		Digest::MD5.hexdigest(params.sort.flatten.unshift(secret_code).join).upcase  
	end

	def create_request_params params  
		params.map{|key,value| "#{key}=#{CGI.escape(value.to_s)}"}.join("&")  
	end

	def get(params)
		@params = @params.merge(params)
		@url = @url + create_request_params(@params.merge('sign' =>sign(@params, @secret)))  
		return @url
		data = nil
		open(@url) do |resp|
		  data = JSON.parse(resp.read)
		end
	end

	def get_user(params)
		@params["method"] = "taobao.user.get"
		@params["fields"] ||= "user_id,uid,nick,sex,buyer_credit,seller_credit,location,created,last_visit,birthday,type,status,alipay_no,alipay_account,alipay_account,email,consumer_protection,alipay_bind"
		@params = @params.merge(params)
		@url = @url + create_request_params(@params.merge('sign' =>sign(@params, @secret)))  
		RestClient.get(@url)
	end

	def get_trades_bought(params)
		@params["method"] = "taobao.trades.bought.get"
		@params["fields"] ||= "seller_nick,buyer_nick,title,type,created,sid,tid,seller_rate,buyer_rate,status,payment,discount_fee,adjust_fee,post_fee,total_fee,pay_time,end_time,modified,consign_time,buyer_obtain_point_fee,point_fee,real_point_fee,received_payment,commission_fee,pic_path,num_iid,num_iid,num,price,cod_fee,cod_status,shipping_type,receiver_name,receiver_state,receiver_city,receiver_district,receiver_address,receiver_zip,receiver_mobile,receiver_phone,orders.title,orders.pic_path,orders.price,orders.num,orders.iid,orders.num_iid,orders.sku_id,orders.refund_status,orders.status,orders.oid,orders.total_fee,orders.payment,orders.discount_fee,orders.adjust_fee,orders.sku_properties_name,orders.item_meal_name,orders.buyer_rate,orders.seller_rate,orders.outer_iid,orders.outer_sku_id,orders.refund_id,orders.seller_type"
		@params = @params.merge(params)
		@url = @url + create_request_params(@params.merge('sign' =>sign(@params, @secret)))  
		RestClient.get(@url)
		# @trades = RestClient.get(@url)
		# JSON.parse(@trades)["trades_bought_get_response"]["trades"]
	end

	def self.get_authentication(oa)
		Authentication.new(:provider => oa["provider"], :uid => oa["uid"], 
			:user_name => oa["user_info"]["name"], :email => oa["user_info"]["email"],
			:oauth_token => oa["credentials"]["token"])
	end


end