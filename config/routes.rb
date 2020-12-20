Rails.application.routes.draw do

  resources :enrollments do
    get :my_students, on: :collection
  end
  devise_for :users

  resources :courses do
    get :purchased, :pending_review, :created, on: :collection
    resources :lessons, except: [:index]
    resources :enrollments, only: [:new, :create]
  end

  resources :users, only: [:index, :edit, :show, :update]

  root 'home#index'
  get 'home/index'
  get 'activity', to: 'home#activity'
  get 'analytics', to: 'home#analytics'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
