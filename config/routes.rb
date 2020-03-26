Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  
  root "tops#home"
  get  '/demo',    to: 'creators#demo'
  get  '/post',    to: 'contents#post'
  get  '/video_new', to: 'contents#video_new'
  post '/video_create', to: 'contents#video_create'

  resources :users, only:[:show]
  resources :creators, only:[:new,:create, :show]
  resources :creator_steps
  resources :contents
  
end
