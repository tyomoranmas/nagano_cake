Rails.application.routes.draw do
  devise_for :end_users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :end_users do
  	resources :products, only: [:index,:show]
  	resources :cart_items, only: [:index,:update,:destroy,:create]
  end
  resource :end_user, only: [:edit, :show, :update]
  get 'admins' => 'admins#top', as: 'top_admin'

  root 'end_users/products#top'
end
