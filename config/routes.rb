Rails.application.routes.draw do

  get 'students/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/competitions', to: 'static_pages#competition_list'
  # standard student sign up route
  get '/signup', to: 'students#new'
end
