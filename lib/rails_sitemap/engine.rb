module RailsSitemap
  class Engine < ::Rails::Engine
    isolate_namespace RailsSitemap

    initializer 'rails_sitemap', before: :load_config_initializers do |app|
      Rails.application.routes.append do
        mount RailsSitemap::Engine => '/'
      end

      Mime::Type.register 'text/xml', :kml
    end
  end

  class << self
    mattr_accessor :models_for_sitemap,
                   :updated_at,
                   :priority,
                   :update_frequency_for_app,
                   :update_frequency_for_models,
                   :locations,
                   :hd_images,
                   :excluded_paths

    self.models_for_sitemap = []
    self.updated_at = DateTime.now.to_s
    self.priority = 0.5
    self.update_frequency_for_app = 'always'
    self.update_frequency_for_models = 'weekly'
    self.locations = []
    self.hd_images = []
    self.excluded_paths = []
  end

  def self.setup(&block)
    yield self
  end
end
