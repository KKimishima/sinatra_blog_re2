# require 'bundler/setup'
require 'bundler'
Bundler.require

require 'sinatra/base'
require 'sinatra/reloader'
# require "./blog"
# まとめて依存をぶっこむ
Dir.glob('./{lib,controllers}/*.rb').each {|file| require file}


run Blog