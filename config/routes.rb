Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :admins, only: [:create]
      post "/login", to: "admins#login"
      get "/auto_login", to: "admins#auto_login"
    
      resources :categories
      resources :products do
        resources :orders, shallow: true
      end
    end
  end
end
