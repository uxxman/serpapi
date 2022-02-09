Serpapi::Engine.routes.draw do
  defaults format: :json do
    resources :products, only: %i[index show]
  end
end
