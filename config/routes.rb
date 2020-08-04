Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/create'
  get 'books/new'
  get 'books/edit'
  get 'books/show'
  get 'books/update'
  get 'books/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      sessions: 'users/sessions',
      passwords: 'users/passwords'
  }
  root 'landing#index'
  get 'landing/index'
  resources :users, :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
