module RailsSitemap
  class ImageEntry
    attr :path, :title, :updated_at, :coordinates

    def initialize(path, title = nil, coordinates = nil,
      updated_at = RailsSitemap.updated_at)

      @path = path
      @title = title
      @coordinates = coordinates
      @updated_at = updated_at
    end
  end
end
