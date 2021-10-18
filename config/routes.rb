Rails.application.routes.draw do

  root 'page#home'

  get 'about', to: "page#about"
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
