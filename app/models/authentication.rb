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
end
