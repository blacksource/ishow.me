class ProductsController < ApplicationController
	def index
		@products = Product.paginate(:page=>params[:page], :per_page=>15)#, :order=>'updated_at DESC')
	end
end
