Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  match 'api', to: 'pastes#api', via: [:post]
  resources :comments
  resources :pastes 
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "pastes#index"
end
