Rails.application.routes.draw do
  # Admin Interface
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # User Authentication
  devise_for :users
  
  # Contract Resource with Analyze Action
  resources :contracts do
    member do
      post 'analyze'
    end
  end
  
  # Suggestion Resource
  resources :suggestions, only: [:index, :show, :new, :create]
  
  # Root Path
  root to: "home#index"
end
