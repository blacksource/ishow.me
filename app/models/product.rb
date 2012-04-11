class Product < ActiveRecord::Base
	has_many	:rebates
	has_many	:shares
end
