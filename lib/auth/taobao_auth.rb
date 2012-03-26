require 'md5'
require 'rest_client'

class TaobaoAuth
	
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
		data = nil
		open(@url) do |resp|
		  data = JSON.parse(resp.read)
		end
	end
end