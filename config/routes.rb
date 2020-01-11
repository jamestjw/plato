Rails.application.routes.draw do
  get 'home/index'
  resources :cards
  resources :tasks do
    post :complete, on: :member
  end
  resources :boards
  resources :organisations
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'users' => 'users#index'
  
  delete 'users/:id' => 'users#destroy', :as => :admin_destroy_user

  root 'home#index', via: :all

  resources :plans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
