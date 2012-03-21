require 'spec_helper'

describe User do
	before {@user = User.new(:email=>"blacksource@126.com", :name=>"blacksource", :password_digest=>"hhhhhh88")}
	
	subject{@user}

	it { should respond_to(:email)}
	it { should respond_to(:name)}
	it { should respond_to(:password_digest)}
	# it { should respond_to(:password)}

	describe "when email format is not invalid" do
		invalid_addreses = ["  ", "user@foo,com", "user_at_foot.org", "example.user@foo."]
		invalid_addreses.each do |invalid_address|
			before { @user.email = invalid_address }
			it { should_not be_valid }
		end
	end

	describe "when name is not present" do
		before {@user.name = "   "}
		it { should_not be_valid}
	end

	describe "when name is too short" do
		before { @user.name = "12" }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 21 }
		it { should_not be_valid }
	end

	# describe "when password is too short" do
	# 	before { @user.password = "12345" }
	# 	it { should_not be_valid }
	# end

	# describe "when password is too long" do
	# 	before { @user.password = "a" * 51 }
	# 	it { should_not be_valid }
 #  	end
end
