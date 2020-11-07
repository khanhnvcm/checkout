Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  resources :products, param: :product_id do
  	member do
  		resources :baskets, only: [ :edit, :update ]
  	end
  end
  get 'baskets', to: 'baskets#index', as: 'index_baskets'
  get 'baskets/remove', to: 'baskets#remove', as: 'remove_baskets'

end
