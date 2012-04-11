require "fileutils"  
class UploadifyController < ApplicationController
	# protect_from_forgery :except => :upload  
	# skip_before_filter :verify_authenticity_token  
  	
  	layout nil

	def upload
		@picture = SharePicture.new(:picture=>params[:picture])
		respond_to do |format|
	  		format.html
		end
	end

	def check
	end

end
