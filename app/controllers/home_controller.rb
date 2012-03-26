# require 'rubygems'  
# require 'net/http'  
# require 'uri'  
require 'md5'  

require 'rest_client'
require 'auth/taobao_auth'

class HomeController < ApplicationController
	def index
      #     consumer = OAuth::Consumer.new('317279585','7c8fa88bb73265c0a0f19b08a77d597f',{:site =>'http://api.t.sina.com.cn'})
      #     access_token = OAuth::AccessToken.new(consumer, "43d4a028c20b5f22050cffdcaba90600", "0ed32bc70dd9c89a2c9fac454f1294e7")
      #     @rsp = access_token.get("/statuses/friends_timeline.json")
  		  # render :text =>  @rsp.body

  		  

	 #      # consumer = OAuth::Consumer.new('317279585','7c8fa88bb73265c0a0f19b08a77d597f',{:site =>'https://api.weibo.com/2'})
		# client = OAuth2::Client.new("APP_ID", "APP_SECRET", {:site =>'https://api.weibo.com/2'}) 
  #         # access_token = OAuth2::AccessToken.new(client, "43d4a028c20b5f22050cffdcaba90600", "0ed32bc70dd9c89a2c9fac454f1294e7")
  #         access_token = OAuth2::AccessToken.new(client, "43d4a028c20b5f22050cffdcaba90600")
  #         @rsp = access_token.get("/statuses/friends_timeline.json")
  # 		  # render :text =>  @rsp.body

		  # consumer = OmniAuth::Strategies::Tsina.new('317279585','7c8fa88bb73265c0a0f19b08a77d597f',{:site =>'http://api.t.sina.com.cn'})
    #       access_token = OAuth::AccessToken.new(consumer, "43d4a028c20b5f22050cffdcaba90600", "0ed32bc70dd9c89a2c9fac454f1294e7")
    #       @rsp = access_token.get("/statuses/friends_timeline.json")
  		#   render :text =>  @rsp.body


		root = "http://gw.api.taobao.com/router/rest?"
		p = {
			'v' => '2.0',  
			'app_key' => '12499162',   
	      	'method' => 'taobao.users.get',  
	      	# 'partner_id' => 'top-apitools',
	      	'format' => 'json',  
	      	'nick' => 'blacksource',
	    	'fields' => 'user_id,nick,sex,buyer_credit,seller_credit,location,created,last_visit',
			'timestamp' => CGI.escape(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
		}
    	p["sign"] = MD5.hexdigest('9598e73bc23ebaaf7eace9d60911ce12' + p.sort.flatten.join + '9598e73bc23ebaaf7eace9d60911ce12').upcase  
    	render :text => root + p.map{|key,value| "#{key}=#{value}"}.join("&")  
		# render :text => RestClient.get(root + p.map{|key,value| "#{key}=#{CGI.escape(value.to_s)}"}.join("&"))
		# render :text => p.each do |key, value| {"#{key}=#{value}"} end
		# @res = RestClient.get(root, {:params => p})
		# render :text => @res.body
		# debugger




  		# @auth = TaobaoAuth.new
  		# render :text => @auth.items
  		# debugger

  		# url = URI.parse("http://www.baidu.com")
		# render :text => Net::HTTP.get_response(url, {'wd' => 'sb'}).body.to_s 
		# render :text => RestClient.get("http://www.baidu.com").body

# url = URI.parse('http://gw.api.tbsandbox.com/router/rest')  
#     p = {  
#       'sip_appkey' => '20426',  
#       'sip_appsecret' => '144098c0d58411ddbc14a92bef58a353',  
#       'sip_apiname' => 'taobao.items.get',  
#       'sip_timestamp' => Time.now.strftime("%Y-%m-%d %H:%M:%S"),  
#       'format' => 'json',  
#       'page_no' => params[:page_no],  
#       'page_size' => params[:page_size],  
#       'v' => '1.0',  
#       'q' => params[:q],  
#       'fields' => 'iid,title,nick,type,cid,pic_path, delist_time,price,post_fee'  
#     }  
#     p["sip_sign"] = MD5.hexdigest('144098c0d58411ddbc14a92bef58a353' + p.sort.flatten.join).upcase  
  
#     resp  = Net::HTTP.post_form(url, p)  
#     render :text => resp.body  

	end
end
