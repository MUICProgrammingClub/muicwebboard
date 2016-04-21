Rails.application.routes.draw do

  get 'instructors/index'

  get 'instructors/show'

  resources :instructors
  get 'courses/index'
  get 'courses/show'

  resources :courses

  devise_for :users
  resources :users, only: [:show]

  root to: "lectures#index"
  resources :reviews, only: [:create, :destroy, :update]

  resources :lectures do
  	member do
  		put :edit_review
  	end
  end





  # resources :users, only: [:index, :show] do
  #   resources :lectures
  # end

end
