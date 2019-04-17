Rails.application.routes.draw do
  devise_for :users
  resources :audiotracks
  root 'audiotracks#index'


end
