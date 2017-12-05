Rails.application.routes.draw do

  get 'admin_users_controller/index'

  get 'admin_users_controller/new'

  get 'admin_users_controller/create'

  get 'admin_users_controller/edit'

  get 'admin_users_controller/update'

  get 'admin_users_controller/delete'

  get 'admin_users_controller/destroy'

  #root 'subjects/index'
  match "/", :to => "subjects#index", :via =>"get"

  get 'admin', :to => "access#menu"
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  
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