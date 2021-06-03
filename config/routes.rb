Rails.application.routes.draw do
  #Study Routes
  get '/', to: 'studies#root', as: 'root'
  get 'studies', to: 'studies#index', as: 'studies_index'
  get 'studies/new', to: 'studies#new', as: 'new_study'
  post 'studies/create', to: 'studies#create', as: 'create_study'
  get 'studies/edit/:id', to: 'studies#edit', as: 'edit_study'
  patch 'studies/update/:id', to: 'studies#update', as: 'update_study'
  get 'studies/destroy/:id', to: 'studies#destroy', as: 'delete_study'

  #Site Routes
  get 'sites', to: 'sites#index', as: 'sites_index'
  get 'sites/study_id', to: 'sites#show', as: 'show_site'
  get 'sites/new', to: 'sites#new', as: 'new_site'
  #get 'studies/:study_id/sites/new', to: 'sites#new', as: 'new_site'
  post 'sites/create', to: 'sites#create', as: 'create_site'

  #Subject Routes
  get 'subjects/index', to: 'subjects#index', as: 'subjects_index'
  get 'subjects/site_id', to: 'subjects#show', as: 'show_subjects'
  get 'subjects/new', to: 'subjects#new', as: 'new_subject'
  post 'subjects/create', to: 'subjects#create', as: 'create_subject'
  get 'subjects/feedback/:id', to: 'subjects#feedback', as: 'subject_feedback'
  patch 'subjects/rate/:id', to: 'subjects#rate', as: 'rate_by_subject'
end