# require 'rubygems'  
# require 'net/http'  
# require 'uri'  
require 'md5'  

require 'rest_client'
require 'oauth/taobao_oauth'

class HomeController < ApplicationController
	def index
		
		# taobao = TaobaoOauth.new(provider,"d60014ad428681e2e7e2be3ef7eb9705")
		# params = {'session' => "6202109821845549ace242995ecf045f4fd8e4adde9919b15602777"}
		# user = taobao.get_user(params)
		# debugger
		# render :text=>user
	end
end
