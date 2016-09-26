RailsSitemap.setup do |config|
  config.models_for_sitemap = %w(Article)
  config.updated_at = '2016-09-22T18:11:05-03:00'
  config.priority = 0.5
  config.update_frequency_for_app = 'always'
  config.update_frequency_for_models = 'weekly'
end
