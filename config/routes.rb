Rails.application.routes.draw do
  resources :subscriptions
  resources :cards
  resources :boards do
    post :activate, on: :member
  end
  resources :plans
  resources :organisations do
    collection do
      post :join
    end    
  end

  resources :tasks do
    post :complete, on: :member
  end  

  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'users' => 'users#index'
  get 'home/index'
  delete 'users/:id' => 'users#destroy', :as => :admin_destroy_user
  root 'home#index', via: :all

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
