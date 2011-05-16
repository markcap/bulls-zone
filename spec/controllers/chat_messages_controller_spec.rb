require File.dirname(__FILE__) + '/../spec_helper'

describe ChatMessagesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => ChatMessage.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    ChatMessage.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    ChatMessage.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(chat_message_url(assigns[:chat_message]))
  end

  it "edit action should render edit template" do
    get :edit, :id => ChatMessage.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    ChatMessage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ChatMessage.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    ChatMessage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ChatMessage.first
    response.should redirect_to(chat_message_url(assigns[:chat_message]))
  end

  it "destroy action should destroy model and redirect to index action" do
    chat_message = ChatMessage.first
    delete :destroy, :id => chat_message
    response.should redirect_to(chat_messages_url)
    ChatMessage.exists?(chat_message.id).should be_false
  end
end
