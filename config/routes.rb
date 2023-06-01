Rails.application.routes.draw do
  get 'sessions/new'
  root "observations#index"

  # patch "/observations/:id", to: "observations#classifyupdate"

  resources :users
  resources :observations do
    member do
      get 'classify'
    end
  end

  # this takes us to a page where we can perform the classification...
  # maybe via flowchart, maybe via drawing, ...?
  # get "/observations/:id/classify", to: "observations#classify"

  # get "/observations", to: "observations#index"
  # get "/observations/:id", to: "observations#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get 'signup' => 'users#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
