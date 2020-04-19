Rails.application.routes.draw do
  require 'sidekiq/web'

  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  devise_for :users, controllers: { 
    omniauth_callbacks: "omniauth_callbacks",
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  
  root "tops#home"
  get  '/post',    to: 'contents#post'
  get  '/video_new', to: 'contents#video_new'
  post '/video_create', to: 'contents#video_create'
  get  '/audio_new', to: 'contents#audio_new'
  post '/audio_create', to: 'contents#audio_create'
  get  '/perks/top', to: 'perks#top'
  get  '/stripe_connect', to: 'perks#stripe_connect'

  resources :users, only:[:show]
  resources :creators, only:[:index, :new, :create, :show, :edit, :update] do
    resources :perks do
      collection do 
        get 'list'
      end
    end
    collection do 
      get 'search'
    end
    member do
      get 'demo'
      get 'creator_perks'
    end
  end
  resources :creator_steps
  resources :contents do
    resource :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resource :subscription

  authenticate :user, lambda {|u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end
end
