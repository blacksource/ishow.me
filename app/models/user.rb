# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  email           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  sex             :string(255)     default("F")
#  status          :string(255)     default("A")
#  birthday        :date
#  last_login_at   :datetime
#  last_login_ip   :string(255)
#  realname        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
	attr_accessor :password

	validates :email, 		:presence => true,
							:format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
							:uniqueness => {:case_sensitive => false}
	validates :password, 	:length => { :minimum => 6, :maximum => 30 }
	validates :name, 		:presence => true,
							:length => { :minimum => 3, :maximum => 20 }

	before_save :encrypt_password

	private
		def encrypt_password
			self.password_digest = Digest::MD5.hexdigest(password)
		end
end
