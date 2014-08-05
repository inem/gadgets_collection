Rails.application.routes.draw do
  devise_for :users
  resources :gadgets

  root 'gadgets#index'
end
