# require 'rubygems'  
# require 'net/http'  
# require 'uri'  
require 'md5'  

require 'rest_client'

class HomeController < ApplicationController
	def index
		# root = "http://gw.api.taobao.com/router/rest?"
		# p = {
		# 	'v' => '2.0',  
		# 	'app_key' => '12499162',   
	 #      	'method' => 'taobao.users.get',  
	 #      	# 'partner_id' => 'top-apitools',
	 #      	'format' => 'json',  
	 #      	'nick' => 'blacksource',
	 #    	'fields' => 'user_id,nick,sex,buyer_credit,seller_credit,location,created,last_visit',
		# 	'timestamp' => CGI.escape(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
		# }
  #   	p["sign"] = MD5.hexdigest('9598e73bc23ebaaf7eace9d60911ce12' + p.sort.flatten.join + '9598e73bc23ebaaf7eace9d60911ce12').upcase  
  #   	render :text => root + p.map{|key,value| "#{key}=#{value}"}.join("&")  
		# render :text => RestClient.get(root + p.map{|key,value| "#{key}=#{CGI.escape(value.to_s)}"}.join("&"))
		# render :text => p.each do |key, value| {"#{key}=#{value}"} end
		# @res = RestClient.get(root, {:params => p})
		# render :text => @res.body
		# debugger


	end
end
