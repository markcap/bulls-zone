require File.dirname(__FILE__) + '/../spec_helper'

describe ArticlesController do
  render_views

  describe "Normal Access" do
  
    before :each do
      @user = Factory(:user, :moderator => 0)
      sign_in @user
    end
    
    context '#index' do
      it "index action should render index template" do
        get :index
        response.should render_template(:index)
      end
    end

    context '#show' do
      it "show action should render show template" do
        get :show, :id => Factory(:article)
        response.should render_template(:show)
      end
    end
    
    context '#new' do
      it "new action should be denied" do
        get :new
        response.should redirect_to denied_path
      end
    end
    
    context '#edit' do
      it "edit action should be denied" do
        get :edit, :id => Factory(:article)
        response.should redirect_to denied_path
      end
    end

    context '#destroy' do
      it "destroy action should be denied" do
        article = Factory(:article)
        delete :destroy, :id => article
        response.should redirect_to denied_path
      end
    end
  end
  
  describe "Moderator Access" do
    
    before :each do
      @user = Factory(:user, :moderator => 1)
      sign_in @user
    end
    
    context '#index' do
      it "index action should render index template" do
        get :index
        response.should render_template(:index)
      end
    end
    
    context '#show' do
      it "show action should render show template" do
        get :show, :id => Factory(:article)
        response.should render_template(:show)
      end
    end

    context '#new' do
      it "new action should be render new template" do
        get :new
        response.should render_template(:new)
      end
    end

    context '#create' do
      it "create action should render new template when model is invalid" do
        Article.any_instance.stubs(:valid?).returns(false)
        post :create
        response.should render_template(:new)
      end

      it "create action should redirect when model is valid" do
        Article.any_instance.stubs(:valid?).returns(true)
        post :create
        response.should redirect_to(article_url(assigns[:article]))
      end
    end
    
    context '#edit' do
      it "edit action should render edit template" do
        get :edit, :id => Factory(:article)
        response.should render_template(:edit)
      end
    end

    context '#update' do

      it "update action should redirect when model is valid" do
        Article.any_instance.stubs(:valid?).returns(true)
        put :update, :id => Factory(:article)
        response.should redirect_to(article_url(assigns[:article]))
      end
    end

    context '#destroy' do
      it "destroy action should destroy model and redirect to index action" do
        article =  Factory(:article)
        delete :destroy, :id => article
        response.should redirect_to(articles_url)
        Article.exists?(article.id).should be_false
      end
    end
  end
end
