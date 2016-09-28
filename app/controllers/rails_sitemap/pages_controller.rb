module RailsSitemap
  class PagesController < ApplicationController
    include RailsSitemap::ActAsSitemap

    EXCLUDED_CONTROLLERS = ['rails/info', nil, 'errors', 'rails/mailers']
    EXCLUDED_ACTIONS = %w(show destroy update edit new create)
    EXCLUDED_PATHS = %w(/)

    before_action :set_routes, only: :index
    before_action :set_custom_paths, only: :index

    def index
      respond_to do |format|
        format.xml
      end
    end

    private

    def set_routes
      @routes = Rails.application.routes.routes.map do |route|
        { alias: route.name,
          path: route.path.spec.to_s,
          controller: route.defaults[:controller],
          action: route.defaults[:action] }
      end

      @routes.reject! do |route|
        EXCLUDED_CONTROLLERS.include?(route[:controller])
      end

      @routes.reject! do |route|
        EXCLUDED_ACTIONS.include?(route[:action])
      end

      @routes.reject! do |route|
        EXCLUDED_PATHS.include?(route[:path])
      end

      @sitemap_entries = @routes.map do|route|
        SitemapEntry.new(route[:path][0..-11])
      end
    end

    def set_custom_paths
      RailsSitemap.models_for_sitemap.each do |model_sitemap|
        model_class = model_sitemap.constantize

        model_class.all.each do |object|
          id = object.try(:slug) || object.id

          object_path = "/#{model_sitemap.underscore.pluralize}/#{id}"
          last_modification = object.updated_at.to_datetime.to_s
          object_priority = RailsSitemap.priority

          @sitemap_entries <<
            SitemapEntry.new(object_path, object_priority, last_modification)
        end
      end

      @sitemap_entries.uniq
    end
  end
end