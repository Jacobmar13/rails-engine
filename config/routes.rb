Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
      end
      resources :items do
        get '/merchant', to: 'merchants#show'
      end
    end
  end
end
