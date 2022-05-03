Rails.application.routes.draw do

  resources :sessions, only: [:new, :index]
  resources :apps, only: [:index]

  resources :kakeibos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
