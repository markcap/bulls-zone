require File.dirname(__FILE__) + '/../spec_helper'

describe AchievementsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Achievement.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Achievement.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Achievement.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(achievement_url(assigns[:achievement]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Achievement.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Achievement.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Achievement.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Achievement.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Achievement.first
    response.should redirect_to(achievement_url(assigns[:achievement]))
  end

  it "destroy action should destroy model and redirect to index action" do
    achievement = Achievement.first
    delete :destroy, :id => achievement
    response.should redirect_to(achievements_url)
    Achievement.exists?(achievement.id).should be_false
  end
end
