Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  root 'landing#index'
  get 'landing/index'
  resources :books do
    resources :borrows, only: [:new, :create, :index, :show, :update]
    get 'reza'
  end
  resources :users do
    resources :borrows, only: [:index, :destroy, :show, :update]
  end
  resources :borrows

  namespace :users do
    get 'authors/new', action: 'new'
  end
  namespace :books do
    get 'search'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
