Rails.application.routes.draw do
  resources :linea_items

  devise_for :users
  resources :products
  resources :customers do
    resources :orders do
      resources :linea_items
    end
  end
  resources :orders do
    resources :products
  end
  resources :orders do
    resources :linea_items
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
