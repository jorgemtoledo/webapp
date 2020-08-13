Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  resources :users
  root 'dashboard#index'
  get 'dashboard/index'

end
