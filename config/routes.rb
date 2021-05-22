Rails.application.routes.draw do
  get '/', to: 'studies#root'
  get 'studies/index', to: 'studies#index', as: 'studies_index'
  get 'studies/new', to: 'studies#new', as: 'new_study'
  post 'studies/create', to: 'studies#create', as: 'create_study'
end