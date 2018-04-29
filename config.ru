# require 'bundler/setup'
require 'bundler'
Bundler.require

require 'sinatra/base'
require 'sinatra/reloader'

# require "./blog"
# まとめて依存をぶっこむ
$LOAD_PATH.unshift("lib")
Dir.glob('./{lib,controllers}/*.rb').each {|file| require file}

if ENV["URL"] and ENV["DATABASE_URL"]
  GithubHook.disable :autopull
else
  require 'rack/cache'
  use Rack::Cache
end

run Blog