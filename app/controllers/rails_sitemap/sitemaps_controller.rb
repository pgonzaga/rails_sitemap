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
      @sitemap_endpoints = %w(
        pages-sitemap
        attachment-sitemap
        geo-sitemap
        post-sitemap
      )
    end
  end
end
