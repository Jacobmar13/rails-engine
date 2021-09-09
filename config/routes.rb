Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#find'
      end
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
      end
      resources :items do
        get '/merchant', to: 'items/merchant#show'
      end
    end
  end
end
