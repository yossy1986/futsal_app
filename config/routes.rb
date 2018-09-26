Rails.application.routes.draw do

  get 'rooms/show'
  get 'apply_matchs/new' => 'apply_matchs#new'
  post 'apply_matchs/create' => 'apply_matchs#create'
  delete 'apply_matchs/destroy' => 'apply_matchs#destroy'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :matchs
  resources :teams
  resources :courts
  resources :posts
  
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
