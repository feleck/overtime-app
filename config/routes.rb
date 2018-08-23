Rails.application.routes.draw do
  resources :posts
  devise_for :users, skip: %i[registrations]
  root to: 'static#homepage'
end
