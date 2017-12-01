Rails.application.routes.draw do

  #root 'subjects/index'
  match "/", :to => "subjects#index", :via =>"get"

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

  
  
  # resources :pages do
  #   member do
  #     get :delete
  #   end
  # end

  # resources :subjects do
  #   member do
  #     get :delete
  #   end
  # end
  
end