Rails.application.routes.draw do
  devise_for :end_users, :controllers => {
    :registrations => 'end_users/registrations',
    :sessions => 'end_users/sessions',
    :passwords => 'end_users/passwords'
  }
  devise_for :admins
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
    resources :genres, only: [:index, :edit, :create, :update]
    resources :products, only: [:index, :new, :edit, :show, :create, :update, :destroy]
  end
  #root 'end_users/products#top'
end
