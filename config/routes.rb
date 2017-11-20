Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'estoque/blanquetas#index'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  namespace :painel do
    resources :recados, except: [:show]
  end

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
          member do
            get :movimento
          end
        end
    end
  end

  namespace :grafiara do
    resources :aniversarios
    resources :calendarios
    resources :casamentos
    resources :lutos
  end

  namespace :tiktak do
    resources :calendarios
    resources :convites
  end

  namespace :cadastro do
    resources :clientes do
      member do
        get :receber_chart
        get :cheques_chart
      end
    end

    resources :fornecedores do
      member do
        get :pagar_chart
      end
    end
  end

  namespace :financeiro do
    resources :cheques
    resources :depositos do
      collection do
        get     :ch,      to: 'depositos#search'
        post    :ch,      to: 'depositos#add'
        delete  'ch/:id', to: 'depositos#remove', as: :ch_remove
      end
    end

    resources :recebimentos, only: [:index, :show, :update] do
      collection do
        get   :remessa
        post  :remessa, to: 'recebimentos#import_remessa'
        get   :retorno
        post  :retorno, to: 'recebimentos#import_retorno'
        get   :summary
      end
    end

    resources :cartoes, controller: :pag_seguro, only: [:index, :show, :update] do
      collection do
        get   :import
        post  :import, to: 'pag_seguro#import_xml'
      end
    end
  end

  match "/403", to: "errors#forbidden", as: :forbidden, via: :all
  match "/404", to: "errors#not_found", as: :not_found, via: :all
  match "/500", to: "errors#internal_server_error", as: :internal_error, via: :all

end
