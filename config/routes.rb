Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :audiotracks
  root 'audiotracks#index'

  resources :playlists

  get '/add/:id', to: 'audiotracks#add', as: :add

end
