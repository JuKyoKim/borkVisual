Rails.application.routes.draw do
    resources :bookmarks
    get 'sessions/new' => 'sessions#new'
 	post 'sessions' => 'sessions#create'
 	delete 'sessions' => 'sessions#destroy'
    resources :users
  	root 'users#index'
  	get '/about', to: 'users#about', as: 'about'
end
