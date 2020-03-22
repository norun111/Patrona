Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  
  root "tops#home"

  resources :users, only:[:show]

  resources :creators do
    collection do
      get 'category'
      get 'restriction'
    end
  end
end
