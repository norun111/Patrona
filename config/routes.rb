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
  get  '/audio_new', to: 'contents#audio_new'
  post '/audio_create', to: 'contents#audio_create'

  resources :users, only:[:show]
  resources :creators, only:[:index, :new, :create, :show]
  resources :creator_steps
  resources :contents
  
end
