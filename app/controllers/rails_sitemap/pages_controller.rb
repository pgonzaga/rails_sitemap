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

    def excluded_path?(path)
      return true if path.empty? || EXCLUDED_PATHS.include?(path)

      RailsSitemap.excluded_paths.include?(path)
    end

    def excluded_wildcards
      RailsSitemap.excluded_paths.select { |path| path.ends_with?('/*') }
    end

    def filter_wildcards(routes)
      wildcards = excluded_wildcards.map(&:chop)

      routes.reject do |route|
        wildcards.any? { |wildcard| route.starts_with?(wildcard) }
      end
    end

    def transform_route(route)
      defaults = route.defaults

      return if EXCLUDED_CONTROLLERS.include?(defaults[:controller])
      return if EXCLUDED_ACTIONS.include?(defaults[:action])

      path = route.format({})
      return if excluded_path?(path)

      path
    end

    def set_routes
      routes = Rails.application.routes.routes.map do |route|
        transform_route(route)
      end.compact

      routes = filter_wildcards(routes)

      object_priority = RailsSitemap.priority
      last_modification = RailsSitemap.updated_at

      @sitemap_entries = routes.map do|route|
        SitemapEntry.new(route, object_priority, last_modification)
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
