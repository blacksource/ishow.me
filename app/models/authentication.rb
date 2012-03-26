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

class Authentication < ActiveRecord::Base
	belongs_to :user

	def self.create_by_oauth(oa)
		Authentication.create(:provider=>oa["provider"], :uid=>oa["uid"],
			:oauth_token=>oa["credentials"]["token"], :oauth_token_secret=>oa["credentials"]["secret"],
			:user_name=>oa["user_info"]["username"], :image=>oa["user_info"]["image"],
			:email=>oa["user_info"]["email"])
	end
end
