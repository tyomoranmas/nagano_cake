Rails.application.routes.draw do
  devise_for :end_users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :end_user, only: [:edit, :show, :update]
  get 'admins' => 'admins#top', as: 'top_admin'
  namespace :admins do
    resources :genres, only: [:index, :edit, :create, :update]
    resources :products, only: [:index, :new, :edit, :show, :create, :update, :destroy]
  end
  root 'end_users/products#top'
end
