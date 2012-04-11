class Share < ActiveRecord::Base
	has_many :share_pictures
	belongs_to :product

	# def to_s
	# 	imgs = "["
	# 	share_images.each do |img|
	# 		imgs += "{image: '/shares/1/#{img.img_b}',
	# 		thumb: '/shares/1/#{img.img_s}',},"
	# 	end
	# 	imgs += "]"
	# end
end
