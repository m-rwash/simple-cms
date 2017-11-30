Rails.application.routes.draw do

  #root 'subjects/index'
  match "/", :to => "subjects#index", :via =>"get"

  get 'sections/index'
  resources :sections do
    member do
      get :delete
    end
  end
  
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
  
end