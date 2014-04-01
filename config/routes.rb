Stylii::Application.routes.draw do

  get '/login', to: 'sessions#new'
  get '/stylist-login', to: 'sessions#new_stylist'

  post '/sessions', to: 'sessions#create'
  post '/stylist_sessions', to: 'sessions#create_stylist_session'

  get '/logout', to: 'sessions#destroy'
  get '/logout-stylist', to: 'sessions#destroy_stylist'

  get 'logged-out', to: 'welcome#goodbye'


  resources :clients

  resources :salons do
    resources :stylists, shallow: true
  end

  resources :appointments

  root to: 'welcome#index'

end
