require "time"
require 'sinatra/base'

class GithubHook < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # def self.parse_git
  #   #git logからハッシュとログを解析
  #   sha1, date = `git log HEAD~1..HEAD --pretty=format:%h%^%ci`.strip.split("^")
  #   set :commit_hash, sha1
  #   set :commit_date, Time.parse(date)
  # end

  # 本番でぷるに反応
  set (:autopull){ production? }
  # parse_git

  before do
    cache_control :public, :must_revalidate
    # etag settings.commit_hash
    # last_modified settings.commit_date
  end

  get "/update" do
    # settings.parse_git
    app.settings.reset!
    load app.settings.app_file
    # stderrをstdoutに出力してすべてを表示するようにする
    # if settings.autopull?
    #   `git pull 2>&1`
    # else
      "OK"
    # end
  end
end