Rails.application.routes.draw do
  #Study Routes
  get '/', to: 'studies#root', as: 'root'
  get 'studies', to: 'studies#index', as: 'studies_index'
  get 'studies/new', to: 'studies#new', as: 'new_study'
  post 'studies/create', to: 'studies#create', as: 'create_study'

  #Site Routes
  get 'sites', to: 'sites#index', as: 'sites_index'
  get 'sites/id', to: 'sites#show', as: 'show_site'
  get 'sites/new', to: 'sites#new', as: 'new_site'
  #get 'studies/:study_id/sites/new', to: 'sites#new', as: 'new_site'
  post 'sites/create', to: 'sites#create', as: 'create_site'
end