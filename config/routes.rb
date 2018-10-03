Rails.application.routes.draw do


  get 'apply_matchs/new' => 'apply_matchs#new'
  post 'apply_matchs/:id/create' => 'apply_matchs#create'
  patch 'apply_matchs/:id/update' => 'apply_matchs#update'
  delete 'apply_matchs/destroy' => 'apply_matchs#destroy'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'teams/serch' => 'teams#serch'
  get 'matchs/index_second' => 'matchs#index_second'
  resources :matchs
  resources :teams
  resources :courts
  resources :posts
  resources :rooms
  resources :messages
  
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

        