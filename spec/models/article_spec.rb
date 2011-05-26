require File.dirname(__FILE__) + '/../spec_helper'

describe Article do
  it "should be valid" do
    Factory(:article).should be_valid
  end
  
  it "should require a subject" do
    Factory.build(:article, :subject => nil).should_not be_valid
  end
  
  it "should require an abstract" do
    Factory.build(:article, :abstract => nil).should_not be_valid
  end
  
  it "should require a body" do
    Factory.build(:article, :body => nil).should_not be_valid
  end
  
  it "should require a user" do
    Factory.build(:article, :user_id => nil).should_not be_valid
  end
  
end
