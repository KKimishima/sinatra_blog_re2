require "time"
require 'sinatra/base'

class GithubHook < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


  get "/update" do
    app.settings.reset!
    load app.settings.app_file
    "OK"
  end
end