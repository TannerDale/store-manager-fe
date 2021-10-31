Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :merchants, only: %i[index show]
end
