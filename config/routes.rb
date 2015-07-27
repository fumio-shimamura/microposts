Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  
  get 'signup', to:'users#new'
  
  get 'show',   to:'users#show'
  
  resources :users
  
end
