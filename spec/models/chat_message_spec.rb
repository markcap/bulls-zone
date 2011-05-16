require File.dirname(__FILE__) + '/../spec_helper'

describe ChatMessage do
  it "should be valid" do
    ChatMessage.new.should be_valid
  end
end
