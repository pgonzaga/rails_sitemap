module RailsSitemap
  class SitemapController < ApplicationController
    BANNED_CONTROLLERS = ['rails/info', nil, 'errors', 'rails/mailers']
    BANNED_ACTIONS = %w(show destroy update edit new create)
    before_action :set_routes, only: :index

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
        BANNED_CONTROLLERS.include?(route[:controller])
      end

      @routes.reject! do |route|
        BANNED_ACTIONS.include?(route[:action])
      end

      @routes = @routes.map do|route|
        route[:path][0..-11]
      end
    end
  end
end
