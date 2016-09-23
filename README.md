# RailsSitemap

## Instalation

Add the gem in your Gemfile

```ruby
gem 'rails_sitemap'
```

The default sitemap only generate the base endpoints, for example if you have the articles resources the sitemap will generate.

```xml
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<urlset
  xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"
  xmlns:geo=\"http://www.google.com/geo/schemas/sitemap/1.0\"
  xmlns:image=\"http://www.google.com/schemas/sitemap-image/1.1\"
  xmlns:mobile=\"http://www.google.com/schemas/sitemap-mobile/1.0\"
  xmlns:news=\"http://www.google.com/schemas/sitemap-news/0.9\"
  xmlns:pagemap=\"http://www.google.com/schemas/sitemap-pagemap/1.0\"
  xmlns:video=\"http://www.google.com/schemas/sitemap-video/1.1\"
  xmlns:xhtml=\"http://www.w3.org/1999/xhtml\"
  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">  
  <url>
    <loc>http://www.example.com</loc>
    <lastmod>2016-09-22T18:11:05-03:00</lastmod>
    <changefreq>always</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>http://www.example.com/articles</loc>
    <lastmod>2016-09-22T18:11:05-03:00</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.5</priority>
  </url>
</urlset>
```

If you want to generate the particular endpoint for each particular resource (in this case for each article) you have to overwrite the default configuration in initializer file.

```console
touch config/initializers/rails_sitemap.rb
```

```ruby
RailsSitemap.setup do |config|
  config.models_for_sitemap = %(Article)
end
```
