Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :products do
        resources :orders, shallow: true
      end
    end
  end
end
