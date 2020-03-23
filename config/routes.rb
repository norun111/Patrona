Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  
  root "tops#home"

  resources :users, only:[:show]
  resources :creators, only:[:new,:create]

  resources :creator_steps
end
