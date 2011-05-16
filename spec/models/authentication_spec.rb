require File.dirname(__FILE__) + '/../spec_helper'

describe Authentication do
  it "should be valid" do
    Factory.build(:authentication).should be_valid
  end
end
