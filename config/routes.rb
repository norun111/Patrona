Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
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
  resources :creators, only:[:index, :new, :create, :show] do
    collection do 
      get 'search'
    end
  end
  resources :creator_steps
  resources :contents do
  resources :comments, only:[:create, :edit, :update, :destroy]
  end


  resources :tiers
end
