Rails.application.routes.draw do 

  resources :mining_types
  get 'welcome/index'
  get 'welcome/show'
  resources :coins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Especificar onde a rota / deve levar
  root to: 'welcome#index'

end
