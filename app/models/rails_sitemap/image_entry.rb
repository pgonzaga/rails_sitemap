module RailsSitemap
  class ImageEntry
    attr :url, :title, :updated_at, :coordinates

    def initialize(url, title = nil, coordinates = nil,
      updated_at = RailsSitemap.updated_at)

      @url = url
      @title = title
      @coordinates = coordinates
      @updated_at = updated_at
    end
  end
end
