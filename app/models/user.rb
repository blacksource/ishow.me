class User < ActiveRecord::Base
	attr_accessible :name, :email, :password

	validates :email, 		:presence => true,
							:format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
							:uniqueness => { :case_sensitive => false }
	# validates :password, 	:length => { :minimum => 6, :maxinum => 50 }
	validates :name, 		:presence => true,
							:length => { :minimum => 3, :maximum => 20 }
end
