Rails.application.routes.draw do

  resources :matchs
  resources :teams
  resources :courts
  resources :posts
  
  get '/' => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
