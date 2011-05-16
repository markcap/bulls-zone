require File.dirname(__FILE__) + '/../spec_helper'

describe Achievement do
  it "should be valid" do
    Achievement.new.should be_valid
  end
end
