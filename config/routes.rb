Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  
  root "tops#home"
  get  '/demo',    to: 'creators#demo'
  get  '/post',    to: 'contents#post'

  resources :users, only:[:show]
  resources :creators, only:[:new,:create, :show]
  resources :creator_steps
  resources :contents, only:[:new,:create]
  resources :videos
  resources :images

end
