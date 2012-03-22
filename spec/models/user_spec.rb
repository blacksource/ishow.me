# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  email           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  sex             :string(255)     default("F")
#  status          :string(255)     default("A")
#  birthday        :date
#  last_login_at   :datetime
#  last_login_ip   :string(255)
#  realname        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
	before {@user = User.new(:email=>"blacksource@126.com", :name=>"blacksource", :password=>"hhhhhh88", :password_digest=>"hhhhhh88")}
	
	subject{@user}

	it { should respond_to(:email)}
	it { should respond_to(:name)}
	it { should respond_to(:password_digest)}
	it { should respond_to(:password)}

	describe "when email format is not invalid" do
		invalid_addreses = ["  ", "user@foo,com", "user_at_foot.org", "example.user@foo."]
		invalid_addreses.each do |invalid_address|
			before { @user.email = invalid_address }
			it { should_not be_valid }
		end
	end

	describe "when email is already exist" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = "12345" }
		it { should_not be_valid }
	end

	describe "when password is too long" do
		before { @user.password = "a" * 31 }
		it { should_not be_valid }
  	end
  	
  	describe "password md5 encrypted is equal to password_digest" do
  		before do
  		 	@user.save
  		end
  		it {subject.password_digest.should eq(Digest::MD5.hexdigest(subject.password)) }
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
end
