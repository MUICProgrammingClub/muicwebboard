Rails.application.routes.draw do
  devise_for :users

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
