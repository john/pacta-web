Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'devise/users/sessions'
  # }

  # namespace :admin do
  #   get '/', action: :index
  # end

  scope module: :admin, path: '/admin', as: 'admin' do
    root to: 'home#index'
  end

  root "home#index"

  resources :organizations
  resources :portfolios
  resources :reports

  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end