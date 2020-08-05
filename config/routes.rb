Rails.application.routes.draw do
  resources :semafors
  get 'borrows/index'
  get 'borrows/show'
  get 'borrows/update'
  get 'borrows/destroy'
  get 'borrows/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      sessions: 'users/sessions',
      passwords: 'users/passwords'
  }
  root 'landing#index'
  get 'landing/index'
  get 'books/search'
  resources :books do
    resources :borrows, only: [:new, :create, :index, :show, :update]
  end
  resources :users do
    resources :borrows, only: [:index, :destroy, :show, :update]
  end
  resources :borrows
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
