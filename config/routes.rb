Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :products
      resources :sessions, only: %i[create destroy]
    end
  end
end
