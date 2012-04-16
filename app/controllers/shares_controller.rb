class SharesController < ApplicationController
	before_filter :signed_in_user, :only => [:new, :create]

	def new
		# synchronize taobao trades
		if current_user.session.nil?
			flash[:notice] = "please bind taobao"
			return
		end
		Trade.sync_trades(provider("taobao"), current_user.id, current_user.session)
		
		@product = Product.find(params[:product_id])
		@share = Share.new(:product_id=>@product.id)

		if Trade.have_bought(current_user.id, @product.num_iid)
			flash[:notice] = "You have bought"
		else
			flash[:notice] = "you have not bought"
		end
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
