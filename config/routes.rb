Serpapi::Engine.routes.draw do
  resources :products, only: %i[index show]

  root to: 'products#index'
end
