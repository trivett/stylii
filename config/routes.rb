Stylii::Application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :clients

  resources :salons do
    resources :stylists, shallow: true
  end

  resources :appointments

  root to: 'welcome#index'

end
