require 'test_helper'

class AttachmentControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success code' do
    get '/attachment-sitemap.xml'
    assert_equal 200, status
  end

  test 'should return the right xml' do
    get '/attachment-sitemap.xml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:image=\"http://www.google.com/schemas/sitemap-image/1.1\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n    <url>\n        <loc>12.417700299999979,45.4930475,0</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n      <image:image>\n        <image:loc>http://www.example.com/assets/mario-3bb8ffa9dfd72eb62696af136f8b05883b8b7623b8773851610c8bf366dfd013.png</image:loc>\n          <image:title>A super fancy mario image</image:title>\n      </image:image>\n    </url>\n</urlset>\n"
  end
end
