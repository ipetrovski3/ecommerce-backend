Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories
      resources :products
    end
  end

  scope :api do
    scope :v1 do
      devise_for :admins, defaults: { format: :json }
    end
  end
end
