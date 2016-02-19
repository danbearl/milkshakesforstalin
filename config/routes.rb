Rails.application.routes.draw do
  get 'log_in' => 'sessions#new', as: :log_in
  get 'log_out' => 'sessions#destroy', as: :log_out

  resources :sessions, only: [:new, :create, :destroy]
  resources :posts

  root to: 'home#index'

end
