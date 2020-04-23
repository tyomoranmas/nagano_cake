Rails.application.routes.draw do

  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'end_users/orders/confirm' => 'end_users/orders#confirm', as: 'end_users_confirm_order'
  get 'end_users/orders/finish' => 'end_users/orders#finish', as: 'end_users_finish_order'

  get 'admins' => 'admins#top', as: 'top_admin'
  delete '/end_users/cart_items' => 'end_users/cart_items#destroy_all', as:'destroy_all'

  resource :end_user, only: [:edit, :show, :update] do
    patch :delete
    get :leave
  end

  namespace :end_users do
    resources :products, only: [:index, :show]
    resources :genres, only: [:show]
    resources :cart_items, only: [:index, :show, :update, :destroy, :create]
    resources :ship_addresses, only: [:index, :edit, :update, :destroy, :create]
    resources :orders, only: [:index, :new, :show, :create]
  end


  namespace :admins do
    resources :end_users, only: [:index, :edit, :show, :update]
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :products, only: [:index, :new, :edit, :show, :create, :update, :destroy]
  end

  root 'end_users/products#top'
end
