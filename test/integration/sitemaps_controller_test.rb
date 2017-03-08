require 'test_helper'

class SitemapsControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success code' do
    get '/sitemap_index.xml'
    assert_equal 200, status
  end

  test 'should return the right xml' do
    get '/sitemap_index.xml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<sitemapindex xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n    <sitemap>\n      <loc>http://www.example.com/pages-sitemap.xml</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    </sitemap>\n    <sitemap>\n      <loc>http://www.example.com/attachment-sitemap.xml</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    </sitemap>\n    <sitemap>\n      <loc>http://www.example.com/geo-sitemap.xml</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    </sitemap>\n    <sitemap>\n      <loc>http://www.example.com/post-sitemap.xml</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    </sitemap>\n</sitemapindex>\n"
  end
end
