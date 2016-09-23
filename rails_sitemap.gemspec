$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_sitemap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_sitemap"
  s.version     = RailsSitemap::VERSION
  s.authors     = ["Pablo Gonzaga"]
  s.email       = ["pgonzaga.uy@gmail.com"]
  s.homepage    = "https://github.com/pgonzaga2012/rails_sitemap"
  s.summary     = "Summary of RailsSitemap."
  s.description = "Description of RailsSitemap."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3"
end
