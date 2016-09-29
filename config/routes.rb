RailsSitemap::Engine.routes.draw do
  get 'pages-sitemap' => 'pages#index'
  get 'attachment-sitemap' => 'attachment#index'
  get 'geo-sitemap' => 'geo#index'
  get 'sitemap_index' => 'sitemaps#index'

  resources :locations, only: :index
end
