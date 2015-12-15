Rails.application.routes.draw do

  devise_for :users
  #, :skip => [:registrations]
  resources :categories, only: [:index, :create]
  #resources :categories, only: [:index, :create]
#  get 'categories/index', as: 'categories'
root :to => redirect('/categories')
  #root to: 'users#index'

  resources :users, only: [:index, :edit, :update, :show]

  #  authenticated :user do
  #    match '/delayed_job' => DelayedJobWeb, :anchor => false, via: [:get, :post]
  #  end

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registrations'
  end


  resources :indications, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :subindications, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :zangfus, only: [:index, :new, :create, :edit, :update, :show, :destroy]

  resources :diseases, only: [:index, :new, :create, :edit, :update, :destroy, :show] do
    get 'diseases/update_subindications', as: 'update_subindications'
    get 'diseases/add_subindication', as: 'add_subindication'
    get 'diseases/remove_subindication', as: 'remove_subindication'
    resources :subindications
  end
  #  map.resources :diseases, :has_many => :subindications

  resources :points, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :herbs, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :herbalformulars, only: [:index, :new, :create, :edit, :update, :show, :destroy]

end
