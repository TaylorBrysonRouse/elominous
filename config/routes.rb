Rails.application.routes.draw do
  devise_for :users

  resources :customers do
    resources :users, :only => [:index, :show] do
      resources :scores, :only => [:index, :show], param: :opponent_id
    end
    resources :leagues do
      resources :games
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "leagues#index", customer_id: @customer
end
