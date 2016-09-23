Rails.application.routes.draw do
  mount RailsSitemap::Engine => "/"
  resources :articles
end
