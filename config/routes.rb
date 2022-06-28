Rails.application.routes.draw do
  resources :games
  devise_for :users
  resources :users, :only => [:index, :show] do
    resources :scores, :only => [:index, :show], param: :opponent_id
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#index"
end
