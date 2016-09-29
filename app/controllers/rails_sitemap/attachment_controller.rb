module RailsSitemap
  class AttachmentController < ApplicationController
    include RailsSitemap::ActAsSitemap

    before_action :set_images

    def index
      respond_to do |format|
        format.xml
      end
    end

    private

    def set_images
      @image_entries = RailsSitemap.hd_images.map do |hd_image|
        image_path = ActionController::Base.helpers.asset_path(hd_image[:name])
        ImageEntry.new(image_path, hd_image[:title], hd_image[:coordinates])
      end
    end
  end
end
