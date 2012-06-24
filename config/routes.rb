Tbone::Engine.routes.draw do
  resources :tokens
  root :to => 'home#index'
end
