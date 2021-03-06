Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#find'
        get '/most_items', to: 'search#top_items_sold'
      end
      namespace :items do
        get '/find_all', to: 'search#find_all'
      end
      namespace :revenue do
        get '/merchants', to: 'merchants#top_earners'
        get '/merchants/:id', to: 'merchants#show'
        get '/items', to: 'items#top_revenue'
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
