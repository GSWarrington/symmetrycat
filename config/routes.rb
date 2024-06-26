Rails.application.routes.draw do
  # get 'site/index'
  # get 'welcome/index'
  # root "observations#index"
  root "welcome#index"
  get '/terms' => 'welcome#TOS'
  get '/privacy' => 'welcome#privacy'
  delete '/logout' => "sessions#destroy"
  get '/observations/summary' => 'observations#summary'
  get '/help' => 'welcome#help'
  get '/help-symmetry' => 'welcome#help-symmetry'
  get '/help-usage' => 'welcome#help-usage'

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
  get '/signup' => 'users#new'
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
