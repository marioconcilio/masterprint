Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :estoque do
    resources :envelopes
    resources :quimicos
    resources :tintas
    resources :variados
  end
end
