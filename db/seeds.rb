# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Provider.create(:name=>"淘宝", :app_key=>"12584221", :app_secret=>"d60014ad428681e2e7e2be3ef7eb9705", :provider_name=>"taobao")
# Provider.create(:name=>"新浪微博", :app_key=>"317279585", :app_secret=>"7c8fa88bb73265c0a0f19b08a77d597f", :provider_name=>"tsina")

# return

Product.create(:name=>"哈森 哈森HARSON女款黑色侧扣", :price=>"300", :image_url=>"1.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 10.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm", :num_iid=>'4051936465')
Product.create(:name=>"罗丝美 灰色条纹3/4杯抹胸文", :price=>"210", :image_url=>"2.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 20.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm", :num_iid=>'111')
Product.create(:name=>"FPI 啡色时尚休闲高跟鞋", :price=>"456", :image_url=>"3.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 30.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm", :num_iid=>'15861784576')

1.upto(50).each do |i|
	Product.create(:name=>"哈森 哈森HARSON女款黑色侧扣#{i}", :price=>"300", :image_url=>"1.jpg", 
	:start_time=>Time.now, :end_time=>Time.now + 20.day, :max_share_count=>20, :shared_count=>5,
	:status=>"A", :source_url=>"http://product.m18.com/p-A123211.htm", :num_iid=>'15861784576')
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


user = User.first
share = Share.create(:comment=>"有一个琳琳的客服每次服务都很耐心很棒，不知道有什么可以表扬她（他）的方式，只能在这上面表扬一下了。衣服很棒，但是也是买大了，难道我瘦了", 
	:status=>"A", :check_status=>"P", :product_id=>1, :user_id=>user.id)
SharePicture.create(:pic_url=>"2012/04/06/222129877004.jpg", :share_id=>share.id)
SharePicture.create(:pic_url=>"2012/04/06/22213011981.jpg", :share_id=>share.id)


