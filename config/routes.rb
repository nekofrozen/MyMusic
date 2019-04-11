Rails.application.routes.draw do
  resources :audiotracks
  root 'audiotracks#index'

  get '/stream/:id', to: 'audiotracks#stream', as: :stream

end
