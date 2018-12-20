Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'tasks#index'
  resources :tasks
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
