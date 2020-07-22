Rails.application.routes.draw do
  get 'hello/hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  # standard REST resource
  resources :articles
  # change the web domain page to hello#hello use the keyword root
  root 'hello#hello'
end
