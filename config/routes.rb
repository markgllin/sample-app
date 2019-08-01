Rails.application.routes.draw do
  root 'static_pages#home'

  # url             # path
  get '/help',      to: 'static_pages#help'
  get '/about',     to: 'static_pages#about'
  get '/contact',   to: 'static_pages#contact'
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'    # corresponding named route = logout_path

  # `resources` provides:
  # index, show, new, create, edit, update, destroy
  resources :users
end
