class ProductsController < ApplicationController
	def index
		@products = Product.paginate(:page=>params[:page], :per_page=>15)#, :order=>'updated_at DESC')
	end

	def show
		@product = Product.find(params[:id])
	end

	def shares
		@product = Product.find(1)
	    respond_to do |format|
	      # format.html { redirect_to @product }
	      format.js
	    end
	end
end
