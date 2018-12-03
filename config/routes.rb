Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do


      scope module: 'merchants' do
        resources :merchants, only: [:index, :show] do
          get '/items', to: 'items#index'
          get '/invoices', to: 'invoices#index'
        end
      end
      resources :merchants, only: [:index, :show]


      resources :items, only: [:index, :show]


      resources :transactions, only: [:index, :show]


      resources :customers, only: [:index, :show]




      resources :invoice_items, only: [:index, :show]
      namespace :invoice_items do
        get '/find', to: 'invoice_item_find#show'
        get '/find_all', to: 'invoice_item_find#index'
        get '/random', to: 'invoice_item_random#show'
      end
      scope module: 'invoice_items' do
        resources :invoice_items do
          get '/invoice', to: 'invoice#show'
          get '/item', to: 'item#show'
        end
      end





      resources :invoices, only: [:index, :show]
      # namespace :invoices do
      #   get '/find', to: 'invoice_find#show'
      #   get '/find_all', to: 'invoice_find#index'
      #   get '/random', to: 'invoice_random#show'
      # end
      scope module: 'invoices' do
        resources :invoices do
          get '/transactions', to: 'transactions#index'
          get '/invoice_items', to: 'invoice_items#index'
          get '/items', to: 'items#index'
          get '/customer', to: 'customer#show'
          get '/merchant', to: 'merchant#show'
        end
      end



    end
  end
end
