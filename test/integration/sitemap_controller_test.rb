require 'test_helper'

class SitemapControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success code' do
    get '/sitemap.xml'
    assert_equal 200, status
  end

  test 'should return the right xml' do
    get '/sitemap.xml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:geo=\"http://www.google.com/geo/schemas/sitemap/1.0\" xmlns:image=\"http://www.google.com/schemas/sitemap-image/1.1\" xmlns:mobile=\"http://www.google.com/schemas/sitemap-mobile/1.0\" xmlns:news=\"http://www.google.com/schemas/sitemap-news/0.9\" xmlns:pagemap=\"http://www.google.com/schemas/sitemap-pagemap/1.0\" xmlns:video=\"http://www.google.com/schemas/sitemap-video/1.1\" xmlns:xhtml=\"http://www.w3.org/1999/xhtml\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\n  <url>\n    <loc>http://www.example.com</loc>\n    <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    <changefreq>always</changefreq>\n    <priority>1.0</priority>\n  </url>\n\n    <url>\n      <loc>http://www.example.com/articles</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n      <changefreq>weekly</changefreq>\n      <priority>0.5</priority>\n    </url>\n</urlset>\n"
  end

  test 'should return the articles on sitemap' do
    Article.find_or_create_by(name: 'My first article')
    get '/sitemap.xml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:geo=\"http://www.google.com/geo/schemas/sitemap/1.0\" xmlns:image=\"http://www.google.com/schemas/sitemap-image/1.1\" xmlns:mobile=\"http://www.google.com/schemas/sitemap-mobile/1.0\" xmlns:news=\"http://www.google.com/schemas/sitemap-news/0.9\" xmlns:pagemap=\"http://www.google.com/schemas/sitemap-pagemap/1.0\" xmlns:video=\"http://www.google.com/schemas/sitemap-video/1.1\" xmlns:xhtml=\"http://www.w3.org/1999/xhtml\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\n  <url>\n    <loc>http://www.example.com</loc>\n    <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n    <changefreq>always</changefreq>\n    <priority>1.0</priority>\n  </url>\n\n    <url>\n      <loc>http://www.example.com/articles</loc>\n      <lastmod>2016-09-22T18:11:05-03:00</lastmod>\n      <changefreq>weekly</changefreq>\n      <priority>0.5</priority>\n    </url>\n    <url>\n      <loc>http://www.example.com/articles/1</loc>\n      <lastmod>" + Article.last.updated_at.to_datetime.to_s + "</lastmod>\n      <changefreq>weekly</changefreq>\n      <priority>0.5</priority>\n    </url>\n</urlset>\n"
  end
end
