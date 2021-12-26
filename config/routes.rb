Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :stocks, only: [:index, :create, :update, :destroy, :show]
      resources :bearers, only: [:index, :create]
    end
  end
end
