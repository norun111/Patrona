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

  resources :creators, only:[:index, :new, :create, :show] do
    resources :contents
    get  '/video_new', to: 'contents#video_new'
    post '/video_create', to: 'contents#video_create'
    get  '/audio_new', to: 'contents#audio_new'
    post '/audio_create', to: 'contents#audio_create'
  end

  resources :creator_steps
  
end
