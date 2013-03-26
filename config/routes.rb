Kcal::Application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  match 'about', to: 'pages#about', as: 'about'

  match 'contact', to: 'messages#new', as: 'contact'

  root to: 'products#index'

  resources :search_suggestions
  resources :products
  resources :messages

end