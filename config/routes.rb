Rails.application.routes.draw do


  get 'apply_matchs/new' => 'apply_matchs#new'
  post 'apply_matchs/:id/create' => 'apply_matchs#create'
  patch 'apply_matchs/:id/update' => 'apply_matchs#update'
  delete 'apply_matchs/destroy' => 'apply_matchs#destroy'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post 'apply_matchs/:id/remove' => 'apply_matchs#remove'
  resources :matchs do
    collection do
    get 'get_facilities'
    end
  end
  resources :teams do
    collection do
    get 'get_facilities'
    end
  end
  resources :courts
  resources :posts
  resources :rooms
  resources :messages
  
  get 'terms' => 'home#terms'
  get 'privacy' => 'home#privacy'
  get 'contact' => 'home#contact'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

        