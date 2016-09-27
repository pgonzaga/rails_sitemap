module RailsSitemap
  module ActAsSitemap
    extend ActiveSupport::Concern

    included do
      before_action :set_current_domain

      protected

      def set_current_domain
        uri = URI.parse(request.original_url)
        pre_html = uri.html_safe? ? 'https://' : 'http://'

        @current_domain = pre_html + uri.hostname
      end
    end
  end
end
