require 'spec_helper'

describe "UserPages" do
	subject { page }

	describe "register page" do
		before { visit register_path }
		describe "register page load" do
			it { should have_selector('title', :text=> "注册") }
		end

		describe "post with invalid infomation" do
			it "should not create a user" do
				expect { click_button "注册" }.not_to change(User, :count)
			end
		end

		describe "post with valid infomation" do
			before do
				fill_in "user_email", 		:with => "blacksource@126.com"
				fill_in "user_password",	:with => "hhhhhh88"
				fill_in "user_name", 		:with => "blacksource"
			end
			it "should create a user" do
				expect { click_button "注册"}.to change(User, :count).by(1)
				user = User.find_by_email("blacksource@126.com")
				user.last_login_ip.should_not be_nil
			end
		end
	end
end
