Rails.application.routes.draw do
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
  resources :suppliers
  resources :posts
	root to: 'startpage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
