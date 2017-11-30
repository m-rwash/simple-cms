Rails.application.routes.draw do
  
  get 'pages/index'
  resources :pages do
    member do
      get :delete
    end
  end

  get 'subjects/index'
  resources :subjects do
    member do
      get :delete
    end
  end



  #match "demo/index", :to => "demo#index", :via => :get
  #get 'demo/index'
  
  #match "/", :to => "demo#index", :via =>"get"
  #root 'demo/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
