require 'test_helper'

class GeoControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success code' do
    get '/geo-sitemap.xml'
    assert_equal 200, status
  end

  test 'should return the right xml' do
    get '/geo-sitemap.xml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:geo=\"http://www.google.com/geo/schemas/sitemap/1.0\">\n  <url>\n    <loc>http://www.example.com/locations.kml</loc>\n    <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    <priority>1</priority>\n  </url>\n</urlset>\n"
  end
end
