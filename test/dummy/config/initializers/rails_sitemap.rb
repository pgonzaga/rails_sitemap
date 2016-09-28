RailsSitemap.setup do |config|
  config.models_for_sitemap = %w(Article)
  config.updated_at = '2016-09-22T18:11:05-03:00'
  config.priority = 0.5
  config.update_frequency_for_app = 'always'
  config.update_frequency_for_models = 'weekly'
  config.locations = [
    {
      name: 'NeonRoots Uruguay Office',
      description: 'Zelmar Michelini 1290 Apto. 401   Esq. San José - Tel.  2909 0655',
      coordinates: '-56.19006872177124,-34.907047903278404,0'
    }
  ]
end
