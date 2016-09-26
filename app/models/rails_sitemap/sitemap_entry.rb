module RailsSitemap
  class SitemapEntry
    attr :path, :priority, :updated_at

    def initialize(path,
                   priority = RailsSitemap.priority,
                   updated_at = RailsSitemap.updated_at)
      @path = path
      @priority = priority
      @updated_at = updated_at
    end
  end
end
