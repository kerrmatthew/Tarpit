require 'spec_helper'


describe User do 

  before(:each) do 
    @user = mock_model(User, :name => "test user", :email => "test@test.com", :password => "123456", :role => "normal")
  end

  it "should be valid" do 
    @user.should be_valid
  end  

  it "should require a role" do 
    @user = User.new(:role => "")
    @user.should have(1).error_on(:role)
  end
  
  it "should require a name" do 
    @user = User.new(:name => "")
    @user.should have(1).error_on(:name)
  end

end