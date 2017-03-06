require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success code' do
    get '/post-sitemap.xml'
    assert_equal 200, status
  end

  test 'should return the right xml' do
    get '/post-sitemap.xml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:geo=\"http://www.google.com/geo/schemas/sitemap/1.0\">\n  <url>\n    <loc>http://www.example.com</loc>\n    <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    <changefreq>always</changefreq>\n    <priority>1.0</priority>\n  </url>\n\n    <url>\n      <loc>http://blog.neonroots.com/category/technology/test.html</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    </url>\n</urlset>\n"
  end
end
