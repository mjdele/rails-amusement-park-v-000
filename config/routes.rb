Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]

  post 'rides/new'

end