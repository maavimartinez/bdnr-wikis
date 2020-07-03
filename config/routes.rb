Rails.application.routes.draw do

  get '/repositories/addCollaboratorShow/:id', to: 'repositories#addCollaboratorShow'
  post '/repositories/addCollaboratorShow/:id', to: 'repositories#addCollaborator'
  resources :users
  resources :revisions
  resources :pages
  resources :wikis
  resources :repositories
  root to: 'authentication#show'
  post '/auth/login', to: 'authentication#login'
  get '/auth/login', to: 'authentication#show'
  get '/home', to: 'repositories#index'
  get '/wikis/new/:name', to: 'wikis#newWiki'
  get '/pages/new/:wiki_id', to: 'pages#newPage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
