RailsSitemap::Engine.routes.draw do
  get 'sitemap' => 'sitemap#index'
  get 'attachment-sitemap' => 'attachment#index'
  get 'geo-sitemap' => 'geo#index'

  resources :locations, only: :index
end
