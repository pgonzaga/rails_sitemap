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
      asset_images = Dir["#{Rails.root}/app/assets/images/*.{jpg,png,gif,svg}"]

      @image_entries = asset_images.map do |asset_image|
        image_name = asset_image.split('/').last
        image_path = ActionController::Base.helpers.asset_path(image_name)

        ImageEntry.new(image_path, @current_domain)
      end
    end
  end
end
