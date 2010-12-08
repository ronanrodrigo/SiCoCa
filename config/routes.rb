Sicoca::Application.routes.draw do
  resources :placas
  resources :tipo_usuarios
  resources :pessoas

  resources :cabo_eleitorals , :belongs_to => :pessoa
  resources :carro_soms , :belongs_to => :pessoa
  resources :doacaos , :belongs_to => :pessoa
  resources :usuarios , :belongs_to => :pessoa
  resources :usuarios , :belongs_to =>  :tipo_usuariosª
  resources :cavaletes, :belongs_to => :placas
  resources :placa_casas, :belongs_to => :pessoa
  resources :placa_casas, :belongs_to => :placas

  root :to => "home#index"
end
