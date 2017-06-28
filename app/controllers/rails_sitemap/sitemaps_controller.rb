module RailsSitemap
  class SitemapsController < ApplicationController
    include RailsSitemap::ActAsSitemap

    STANDARD_ENDPOINTS = %w(
      pages-sitemap
      attachment-sitemap
      geo-sitemap
      post-sitemap
    ).freeze

    before_action :set_sitemaps

    def index
      respond_to do |format|
        format.xml
      end
    end

    private

    def set_sitemaps
      custom_endpoints = RailsSitemap.custom_endpoints || []
      @sitemap_endpoints = STANDARD_ENDPOINTS + custom_endpoints
    end
  end
end
