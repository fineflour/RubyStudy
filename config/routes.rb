Rails.application.routes.draw do

  devise_for :users
  #, :skip => [:registrations]
j
  resources :users, only: [:index, :edit, :update, :show]

#  authenticated :user do
#    match '/delayed_job' => DelayedJobWeb, :anchor => false, via: [:get, :post]
#  end

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registrations'
  end
  

  resources :indications, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :zangfus, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :diseases, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :points, only: [:index, :new, :create, :edit, :update, :show, :destroy]

  root to: 'users#index'
end
