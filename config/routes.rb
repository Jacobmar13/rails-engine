Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#find'
      end
      namespace :items do
        get '/find_all', to: 'search#find_all'
      end
      namespace :revenue do
        get '/merchants', to: 'merchants#top_earners'
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
