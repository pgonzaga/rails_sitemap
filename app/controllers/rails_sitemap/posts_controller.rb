module RailsSitemap
  class PostsController < ApplicationController
    include RailsSitemap::ActAsSitemap
    before_action :set_posts

    def index
      respond_to do |format|
        format.xml
      end
    end

    private

    def set_posts
      @posts = RailsSitemap.posts ||= []
    end
  end
end
