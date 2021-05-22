Rails.application.routes.draw do
  get 'studies/index', to: 'studies#index', as: 'studies_index'
end
