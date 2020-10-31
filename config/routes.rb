Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "sidekiq"
  devise_for :users
  resources :users
  root 'users#index'
  get 'sales/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
