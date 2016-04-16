Rails.application.routes.draw do
  devise_for :users

  root to: "lectures#index"
  resources :lectures

  # resources :users, only: [:index, :show] do
  #   resources :lectures
  # end

end
