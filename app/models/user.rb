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

	validates :email, 		:presence => { :message => "邮箱不能为空" },
							:format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, 
										:message => "邮箱格式不正确" },
							:uniqueness => {:case_sensitive => false, 
										:message => "邮箱已存在" }
	validates :password, 	:length => { :minimum => 6, :maximum => 30, 
										:message => "请输入6~30位长度的密码" }
	validates :name, 		:presence => { :message => "用户名不能为空"},
							:length => { :minimum => 3, :maximum => 30,
										:message => "请输入3~30位长度的名字" }
	has_many :authentications

	before_save :encrypt_password

	# check user`s email and password is correct
	def authentication
		user = User.find_by_email(email)
		# email is not exist
		if user.nil?
			return nil
		end
		encrypt_password
		# password is not correct
		if password_digest != user.password_digest
			self.password_digest = nil
			return self
		end
		return user
	end
	
	private
		def encrypt_password
			self.password_digest = Digest::MD5.hexdigest(password)
		end
end
