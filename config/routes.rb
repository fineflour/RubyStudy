Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :users, only: [:index, :edit, :update, :show]
  resources :indications, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :zangfus, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :diseases, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :points, only: [:index, :new, :create, :edit, :update, :show, :destroy]

  root to: 'users#index'
end
