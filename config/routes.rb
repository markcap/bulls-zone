Bulls::Application.routes.draw do
  resources :chat_messages

  resources :achievements

  resources :authentications
  
  match '/auth/:provider/callback' => 'authentications#create'

  devise_for :users
  
  resources :users

  resources :games
  
  resources :home

  root :to => "home#index"
  
  match '/chat', :to => 'home#chat'
  match '/error', :to => 'home#error'
  match '/denied', :to => 'home#denied'
  match 'pusher/auth', :to => 'pusher#auth'
  
end
