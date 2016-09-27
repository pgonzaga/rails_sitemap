RailsSitemap::Engine.routes.draw do
  get "sitemap" => "sitemap#index"
  get "attachment-sitemap" => "attachment#index"
end
