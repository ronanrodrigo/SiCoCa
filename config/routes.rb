Sicoca::Application.routes.draw do
  resources :placas
  resources :tipo_usuarios
  resources :pessoas

  resources :cabo_eleitorals do
    resources :pessoas
  end

  resources :carro_soms do
    resources :pessoas
  end

  resources :doacaos do
    resources :pessoas
  end

  resources :usuarios do
    resources :pessoas
    resources :tipo_usuarios
  end

  resources :cavaletes do
    resources :placas
  end

  resources :placa_casas do
    resources :pessoas
    resources :placas
  end

  #get "home/index"
  root :to => "home#index"
end
