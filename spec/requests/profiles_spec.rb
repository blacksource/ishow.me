require 'spec_helper'

describe "Profiles" do
	before { @user = User.create(:name=>"blacksource", :password=>"hhhhhh88",
		:email=>"blacksource@126.com") }
	subject { page }

	describe 'edit_userinfo page' do
		before { visit edit_userinfo_profile_path @user}

		describe 'when edit_userinfo page loaded' do
			it { should have_selector('title', :text=>'设置个人信息')}
			it { should have_selector("input[id='user_name']", :value=>'blacksource')}
		end

		describe ''
	end
end
