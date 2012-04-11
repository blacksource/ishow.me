class SharesController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@share = Share.new(:product_id=>@product.id)
	end

	def create
		share = Share.new(params[:share])
		share.user_id = current_user.user_id
		if share.save
			params[:share_pictures].each do |i|
				share_picture = SharePicture.new(i)
				share_picture.picture = File.open("#{Rails.root}/public#{i[:picture_url]}")
				share_picture.share_id = share.id
				share_picture.product_id = share.product_id
				share_picture.save()
			end
		end
	end
end
