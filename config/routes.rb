Rails.application.routes.draw do

  root 'public#index'

  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  #root 'subjects/index'
  #match "/", :to => "subjects#index", :via =>"get"

  get 'admin', :to => "access#menu"
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end
  
  resources :subjects do
    member do
      get :delete
    end
    resources :pages do
      member do
        get :delete
      end
      resources :sections do
        member do
          get :delete
        end
      end
    end
  end
  
end