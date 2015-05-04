Rails.application.routes.draw do
  resources :comments
  resources :pastes
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "pastes#index"
end
