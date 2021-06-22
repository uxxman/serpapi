Rails.application.routes.draw do
  mount Serpapi::Engine => '/serpapi'
end
