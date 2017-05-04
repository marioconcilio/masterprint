Rails.application.routes.draw do
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :estoque do
    resources :blanquetas
    resources :chapas
    resources :envelopes
    resources :quimicos
    resources :tintas
    resources :variados
  end
end
