module RailsSitemap
  class SitemapsController < ApplicationController
    include RailsSitemap::ActAsSitemap
    before_action :set_sitemaps

    def index
      respond_to do |format|
        format.xml
      end
    end

    private

    def set_sitemaps
      standar_endpoints = %w(
        pages-sitemap
        attachment-sitemap
        geo-sitemap
        post-sitemap
      )

      custom_endpoints = RailsSitemap.custom_endpoints || []
      @sitemap_endpoints = standar_endpoints + custom_endpoints
    end
  end
end
