require 'spec_helper'

describe User do
  
  it "factory should be valid" do
    Factory(:user).should be_valid
  end
  
  it "invalid with a non-unique display_name" do
    user1 = Factory(:user, :display_name => "name")
    user2 = Factory.build(:user, :display_name => "name")
    user2.should_not be_valid
  end
  
  it "invalid with invalid pw" do
    Factory.build(:user, :email => "dwdwadwadawda").should_not be_valid
  end
  
  it "should not require password for twitter/facebook logins" do
    user = User.new(:email => nil, :validate => false)
    auth = Factory(:authentication, :user => user)
    user.password_required?.should == false
  end
    
end
