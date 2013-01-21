$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zpages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zpages"
  s.version     = ZPages::VERSION
  s.authors     = ["Marcelo Jacobus"]
  s.email       = ["marcelo@zira.com.br"]
  s.homepage    = "TODO"
  s.summary     = "Simple embeded page creator"
  s.description = "Simple embeded page creator. Should I be called CMS? Not sure."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "paperclip", "~> 3.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers", "~>1.0"#, "~> 3.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-inotify"
  s.add_development_dependency 'simplecov'

end
