Rails.application.routes.draw do

  root 'page#home'

  get 'about', to: "page#about"
  resources :articles

  get 'signup', to:"users#new"
  resources :users, except: [:new]

  get 'login',      to: 'sessions#new'
  post 'login',     to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  resources :users, except: [:new]
  resources :categories, except: [:destroy]

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end