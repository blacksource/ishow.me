require 'md5'
require 'rest_client'

class TaobaoAuth
	
	def users
		root = "http://gw.api.taobao.com/router/rest"
		p = {
			'timestamp' => Time.now.strftime("%Y-%m-%d %H:%M:%S"),  
			'v' => '2.0',  
			'app_key' => '12499162',   
	      	'method' => 'taobao.users.get',  
	      	'partner_id' => 'top-apitools',
	      	'format' => 'json',  
	      	'nicks' => 'blacksource',
	    	'fields' => 'user_id,nick,sex,buyer_credit,seller_credit,location,created,last_visit'
		}
    	p["sign"] = MD5.hexdigest('9598e73bc23ebaaf7eace9d60911ce12' + p.sort.flatten.join + '9598e73bc23ebaaf7eace9d60911ce12').upcase  
		RestClient.get(root, p).body	
	end

	def items
		# url = URI.parse('http://gw.api.tbsandbox.com/router/rest')
		url = URI.parse("http://www.baidu.com")
		Net::HTTP.post_form(url, "") 


		render :text => RestClient.get("http://gw.api.taobao.com/router/rest?sign=3773C216D5474EC9D868807E4657797E&timestamp=2012-03-25+13%3A28%3A33&v=2.0&app_key=12499162&method=taobao.users.get&partner_id=top-apitools&format=json&nicks=blacksource&fields=user_id,nick,sex,buyer_credit,seller_credit,location,created,last_visit").body
	end
end