# == Schema Information
#
# Table name: authentications
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  provider           :string(20)
#  oauth_token        :string(50)
#  oauth_token_secret :string(50)
#  uid                :string(20)
#  user_name          :string(50)
#  image              :string(100)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Authentication do
	before {@auth = Authentication.new(:provider=>"taobao", :oauth_token=>"759904a17a9061e0f9f080b269194c6f", 
		:uid => "123", :user_name => "blacksource", :image => "http://tp2.sinaimg.cn/1708681445/50/1297435718/1")}
	subject{@auth}

	it { should respond_to(:provider) }
	it { should respond_to(:oauth_token) }
	it { should respond_to(:oauth_token_secret) }
	it { should respond_to(:uid) }
	it { should respond_to(:user_name) }
	it { should respond_to(:image) }
	
end
