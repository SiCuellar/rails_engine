Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

#--------------------------------------------------------
      resources :merchants, only: [:index, :show]

      scope module: 'merchants' do
        resources :merchants, only: [:index, :show] do
          get '/items', to: 'items#index'
          get '/invoices', to: 'invoices#index'
        end
      end

#--------------------------------------------------------
      resources :items, only: [:index, :show]

      namespace :items do
        get '/find', to: 'item_find#show'
        get '/find_all', to: 'item_find#index'
      end

      scope module: 'items' do
        resources :items do
          get '/invoice_items', to: 'invoice_items#index'
          get '/merchant', to: 'merchant#show'
        end
      end

#--------------------------------------------------------
      resources :transactions, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'transaction_find#show'
        get '/find_all', to: 'transaction_find#index'
        get '/random', to: 'transaction_random#show'
      end

      scope module: 'transactions' do
        resources :transactions do
          get '/invoice', to: 'invoice#show'
        end
      end

#--------------------------------------------------------
      resources :customers, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      scope module: 'customers' do
        resources :customers do
          get '/invoices', to: 'invoices#index'
          get '/transactions', to: 'transactions#index'
        end
      end

#--------------------------------------------------------
      resources :invoice_items, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      scope module: 'invoice_items' do
        resources :invoice_items do
          get '/invoice', to: 'invoice#show'
          get '/item', to: 'item#show'
        end
      end

#--------------------------------------------------------
      resources :invoices, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'invoice_find#show'
        get '/find_all', to: 'invoice_find#index'
        get '/random', to: 'invoice_random#show'
      end

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
