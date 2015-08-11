Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  get 'signup', to:'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get     'profile'   => 'sessions#edit'
  patch   'profile'   => 'sessions#update'

  get '/follower/:id',  to: 'users#followings', as: 'follower'
  get '/followed/:id',  to: 'users#followers',  as: 'followed'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]

end
