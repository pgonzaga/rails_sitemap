module RailsSitemap
  class ImageEntry
    attr :path, :title, :updated_at, :used_in

    def initialize(path, used_in, updated_at = RailsSitemap.updated_at)
      @path = path
      @title = "![CDATA[#{@path.split('/').last}]]"
      @used_in = used_in
      @updated_at = updated_at
    end
  end
end
