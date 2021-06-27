Rails.application.routes.draw do
  #Study Routes
  get '/', to: 'studies#root', as: 'root'
  get 'studies', to: 'studies#index', as: 'studies_index'
  get 'studies/new', to: 'studies#new', as: 'new_study'
  post 'studies/create', to: 'studies#create', as: 'create_study'
  get 'studies/edit/:id', to: 'studies#edit', as: 'edit_study'
  patch 'studies/update/:id', to: 'studies#update', as: 'update_study'
  get 'studies/destroy/:id', to: 'studies#destroy', as: 'delete_study'
  get 'studies/report/:id', to: 'studies#report', as: 'generate_report'

  #Site Routes
  get 'sites', to: 'sites#index', as: 'sites_index'
  get 'sites/study_id', to: 'sites#show', as: 'show_site'
  get 'sites/new', to: 'sites#new', as: 'new_site'
  #get 'studies/:study_id/sites/new', to: 'sites#new', as: 'new_site'
  post 'sites/create', to: 'sites#create', as: 'create_site'
  get 'sites/edit/:id', to: 'sites#edit', as: 'edit_site'
  patch 'sites/update/:id', to: 'sites#update', as: 'update_site'
  get 'sites/destroy/:id', to: 'sites#destroy', as: 'delete_site'

  #Subject Routes
  get 'subjects/index', to: 'subjects#index', as: 'subjects_index'
  get 'subjects/site_id', to: 'subjects#show', as: 'show_subjects'
  get 'subjects/new', to: 'subjects#new', as: 'new_subject'
  post 'subjects/create', to: 'subjects#create', as: 'create_subject'
  get 'subjects/feedback/:id', to: 'subjects#feedback', as: 'subject_feedback'
  patch 'subjects/rate/:id', to: 'subjects#rate', as: 'rate_by_subject'
  get 'subjects/update_sites', as: 'update_sites'
  get 'subjects/edit/:id', to: 'subjects#edit', as: 'edit_sub'
  patch 'subjects/update/:id', to: 'subjects#update', as: 'update_sub'
  get 'subjects/destroy/:id', to: 'subjects#destroy', as: 'delete_sub'

  #Trial Progress
  get 'progress', to: 'trial_progress#progress', as: 'progress'
  get 'progress/study_id', to: 'trial_progress#show_progress', as: 'show_progress'
  get 'status/study_id', to: 'trial_progress#show_status', as: 'show_status'
  patch 'progress/study_id', to: 'trial_progress#mark_complete', as: 'mark_complete'
end