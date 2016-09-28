module RailsSitemap
  class LocationsController < ApplicationController
    before_action :set_locations

    def index
      respond_to do |format|
        format.kml
      end
    end

    private

    def set_locations
      @locations = RailsSitemap.locations ||= []
    end
  end
end
