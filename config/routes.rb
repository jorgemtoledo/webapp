Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  get '/appointments/history/:id', to: 'appointments#appointment_history', as: :appointment_history

  resources :users
  root 'dashboard#index'
  get 'dashboard/index'

end
