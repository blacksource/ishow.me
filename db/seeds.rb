# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Product.create(:name=>"哈森 哈森HARSON女款黑色侧扣", :price=>"300", :image=>"1.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 10, :max_share_count=>20, :shared_count=>5,
	:status=>"A")
Product.create(:name=>"罗丝美 灰色条纹3/4杯抹胸文", :price=>"210", :image=>"2.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 10, :max_share_count=>20, :shared_count=>5,
	:status=>"A")
Product.create(:name=>"FPI 啡色时尚休闲高跟鞋", :price=>"456", :image=>"3.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 10, :max_share_count=>20, :shared_count=>5,
	:status=>"A")