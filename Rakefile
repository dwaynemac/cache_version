require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('cache_version', '0.1.0') do |p|
  p.description    = "Keep Models Cache versions"
  p.url            = "http://github.com/dwaynemac/cache_version"
  p.author         = "Dwayne Macgowan"
  p.email          = "dwaynemac@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each{|ext| load ext }
