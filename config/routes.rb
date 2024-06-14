Rails.application.routes.draw do
  get 'welcome/index'
  # Admin Interface
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # User Authentication
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
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
 # root to: "welcome#index"
  



  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end
  
end
