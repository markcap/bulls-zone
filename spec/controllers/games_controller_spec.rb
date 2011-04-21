require File.dirname(__FILE__) + '/../spec_helper'

describe GamesController do
  render_views

  before :each do
    @user = Factory(:user)
    sign_in @user
  end
  
  context '#index' do  
    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it 'displays all games' do
      game = Factory(:game)
      get :index
      response.body.should contain(game.opponent)
    end 
    
    it 'has link to new game' do
      get :index
      response.body.should contain("New Game")
    end
    
    it 'displays a button to edit the game' do
      Factory(:game)
      get :index
      response.body.should contain("Edit")
    end
    
    it 'displays a button to delete the game' do
      Factory(:game)
      get :index
      response.body.should contain("Delete")
    end
    
  end
  
  context '#show' do  
    it "show action should render show template" do
      get :show, :id => Factory(:game)
      response.should render_template(:show)
    end
  end
  
  context '#new' do 
    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end
  end
  
  context '#create' do 
    context 'with valid attributes' do
      it 'adds the game to the database' do
        expect {
          post :create, :game => Factory(:game)
        }.to change(Game, :count).by(1)
      end
    
      it "create action should redirect when model is valid" do
        Game.any_instance.stubs(:valid?).returns(true)
        post :create
        response.should redirect_to(new_equipment_path)
      end
    end
    
    context 'with invalid attributes' do
      it "create action should render new template when model is invalid" do
        Game.any_instance.stubs(:valid?).returns(false)
        post :create
        response.should render_template(:new)
      end
      
      it 'does not add the game to the database' do
        expect {
          post :create, :game => Factory.attributes_for(:invalid_game)
        }.to_not change(Game, :count)
      end
    end
  end
  
  context '#update' do
    
    context 'with valid attributes' do
      it "update action should redirect when model is valid" do
        put :update, :id => Factory(:game)
        response.should redirect_to(games_url)
      end    
    end
    
    context 'with invalid attributes' do
      
      it "update action should render edit template when model is invalid" do
        game = Factory(:game)
        put :update, :id => game, :game => Factory.attributes_for(:game, :id => game.id, :opponent => nil)
        response.should render_template(:edit)
      end
    end
  end

  context '#destroy' do
  
    it "destroy action should destroy model and redirect to index action" do
      game = Factory(:game)
      delete :destroy, :id => game
      response.should redirect_to(games_url)
      Game.exists?(game.id).should be_false
    end
  end

end
