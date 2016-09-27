require 'test_helper'

class AttachmentControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success code' do
    get '/attachment-sitemap.xml'
    assert_equal 200, status
  end

  test 'should return the right xml' do
    get '/attachment-sitemap.xml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?><?xml-stylesheet type=\"text/xsl\" href=http://www.example.com/main-sitemap.xsl?>\n<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:image=\"http://www.google.com/schemas/sitemap-image/1.1\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n\n  <url>\n    <loc>http://www.example.com</loc>\n    <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    <image:image>\n    <image:loc>http://www.example.com/assets/mario-3bb8ffa9dfd72eb62696af136f8b05883b8b7623b8773851610c8bf366dfd013.png</image:loc>\n    <image:title>![CDATA[mario-3bb8ffa9dfd72eb62696af136f8b05883b8b7623b8773851610c8bf366dfd013.png]]</image:title>\n  </image:image>\n  </url>\n"
  end
end
