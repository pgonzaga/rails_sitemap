module RailsSitemap
  class GeoController < ApplicationController
    include RailsSitemap::ActAsSitemap

    def index
      respond_to do |format|
        format.xml
      end
    end
  end
end
