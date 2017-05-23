Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'estoque/blanquetas#index'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  namespace :estoque do
    resources :blanquetas
    resources :chapas
    resources :envelopes
    resources :quimicos
    resources :tintas
    resources :variados
  end

  namespace :cadastro do
    resources :clientes
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

end
