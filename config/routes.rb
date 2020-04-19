Rails.application.routes.draw do
  devise_for :end_users, :controllers => {
    :registrations => 'end_users/registrations',
    :sessions => 'end_users/sessions',
    :passwords => 'end_users/passwords'
  }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD

  resource :end_user, only: [:edit, :show, :update] do
    patch :delete
    get :leave
  end
=======
  namespace :end_users do
  	resources :products, only: [:index,:show]
  	resources :cart_items, only: [:index,:update,:destroy,:create]
  end
  resource :end_user, only: [:edit, :show, :update]
>>>>>>> furu
  get 'admins' => 'admins#top', as: 'top_admin'

  root 'end_users/products#top'
end
