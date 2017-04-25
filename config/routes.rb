Rails.application.routes.draw do

  resources :records
  resources :categories
  # only: [:index, :create]
  #resources :categories, only: [:index, :create]
#  get 'categories/index', as: 'categories'
#root :to => redirect('/categories')
  root to: 'users#index'

  devise_for :users , :skip => [:registrations]
  resources :users, only: [:new, :create, :index, :update, :show, :edit] do
    get 'deactivate', as: 'deactivate'
  end
  resources :users, :controller => "users"

  #  authenticated :user do
  #    match '/delayed_job' => DelayedJobWeb, :anchor => false, via: [:get, :post]
  #  end

  #Overwrite Devise route
#  as :user do
#    get 'users/edit' => 'users/edit', :as => 'edit_user'
#  end


  resources :indications, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    collection { post :import }
  end
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
