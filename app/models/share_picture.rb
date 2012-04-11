class SharePicture < ActiveRecord::Base
	belongs_to :share
	
	attr_accessible :picture
	attr_accessor :product_id
	mount_uploader :picture, PictureUploader, :mount_on => :picture_url
end
