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

  resource :end_user, only: [:edit, :show, :update] do
    patch :delete
    get :leave
  end

  namespace :end_users do
    resources :ship_addresses, only: [:index, :edit, :update, :destroy, :create]
  end
  get 'admins' => 'admins#top', as: 'top_admin'

  namespace :admins do
  resources :end_users, only: [:index, :edit, :show, :update]
  resources :orders, only: [:index, :show, :update]
  end

  get 'end_users/products' => 'end_users/products#index'

end
