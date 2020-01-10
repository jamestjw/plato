Rails.application.routes.draw do
  resources :organisations
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'users' => 'users#index'
  root 'users#index', as: 'users_index', via: :all

  resources :plans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
