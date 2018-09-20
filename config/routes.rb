Rails.application.routes.draw do
  resources :audit_logs, except: %i[new edit destroy]
  namespace :admin do
    resources :posts
    resources :users
    resources :admin_users
    root to: 'posts#index'
  end
  resources :posts do
    member do
      get :approve
    end
  end
  devise_for :users, skip: %i[registrations]
  root to: 'static#homepage'
end
