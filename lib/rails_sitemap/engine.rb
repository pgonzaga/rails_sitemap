module RailsSitemap
  class Engine < ::Rails::Engine
    isolate_namespace RailsSitemap

    initializer 'rails_sitemap', before: :load_config_initializers do |app|
      Rails.application.routes.append do
        mount RailsSitemap::Engine => '/'
      end
    end
  end

  class << self
    mattr_accessor :models_for_sitemap
    self.models_for_sitemap = []
  end

  def self.setup(&block)
    yield self
  end
end
