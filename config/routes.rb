Rails.application.routes.draw do
  resources :accounts
  resources :cashes
  resources :usingtypes
  resources :suppliers
  resources :modelprices
  resources :inventories
  resources :ratecurries
  resources :currencies
  resources :modelsets
  resources :descriptions
  resources :budgetitems
  resources :products
  resources :units
  resources :brands
  resources :categories
  resources :posts
  resources :startpage
  
#	root to: 'inventories#index'
  root to: 'startpage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
