# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Product.create(:name=>"哈森 哈森HARSON女款黑色侧扣", :price=>"300", :image_url=>"1.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 10.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm")
Product.create(:name=>"罗丝美 灰色条纹3/4杯抹胸文", :price=>"210", :image_url=>"2.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 20.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm")
Product.create(:name=>"FPI 啡色时尚休闲高跟鞋", :price=>"456", :image_url=>"3.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 30.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm")

1.upto(50).each do |i|
	Product.create(:name=>"哈森 哈森HARSON女款黑色侧扣#{i}", :price=>"300", :image_url=>"1.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 20.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm")
end

Product.update_all :detail=>"<img src=\"http://img4.m18.com/IMG2009/others/20120315/12P2-ali.jpg\">
	<img src=\"http://img4.m18.com/IMG2009/others/20120315/R123054_01.jpg\">
	<img src=\"http://img4.m18.com/IMG2009/others/20120315/R123054_02.jpg\">
	<img src=\"http://img4.m18.com/IMG2009/others/20120315/R123054_03.jpg\">"


Rebate.create(:product_id=>1, :level=>1, :amount=>300)
Rebate.create(:product_id=>1, :level=>2, :amount=>200)
Rebate.create(:product_id=>1, :level=>3, :amount=>100)
Rebate.create(:product_id=>1, :level=>99, :amount=>50)

2.upto(50).each do |i|
	Rebate.create(:product_id=>i, :level=>1, :amount=>100)
	Rebate.create(:product_id=>i, :level=>2, :amount=>50)
	Rebate.create(:product_id=>i, :level=>99, :amount=>30)
end