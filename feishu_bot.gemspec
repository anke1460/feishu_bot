$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "feishu_bot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "feishu_bot"
  spec.version     = FeishuBot::VERSION
  spec.authors     = ["anke1460"]
  spec.email       = ["zuosjob@gmail.com"]
  spec.homepage    = "https://github.com/anke1460/feishu_bot"
  spec.summary     = "Summary of FeishuBot."
  spec.description = "Description of FeishuBot."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_dependency "http", ">= 4.4.1"

  spec.add_development_dependency "sqlite3"
end
