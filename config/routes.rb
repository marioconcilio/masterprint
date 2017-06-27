Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'estoque/blanquetas#index'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  namespace :estoque do
    [:blanquetas,
     :chapas,
     :envelopes,
     :papeis,
     :cortado_papeis,
     :quimicos,
     :tintas,
     :variados].each do |r|
        resources r do
          get :movimento
        end
    end
  end

  namespace :cadastro do
    resources :clientes
  end

  namespace :financeiro do
    resources :recebimentos, only: [:index, :show, :update] do
      collection do
        get   :remessa
        post  :remessa, to: 'recebimentos#import_remessa'
        get   :retorno
        post  :retorno, to: 'recebimentos#import_retorno'
      end
    end
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

end
