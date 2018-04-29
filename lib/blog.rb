require 'bundler'
Bundler.require

require 'yaml'
require "ostruct"
require "time"
require "rdiscount"
require './lib/github_hook'

class Blog <Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  use GithubHook

  # 絶対パスの設定
  # 外のフォルダにアセットブログ記事を保存
  set :root , File.expand_path("../../",__FILE__)
  set :articles, []
  set :app_file, __FILE__

  # markdownテスト
  # get ("/"){markdown "# Markdown  \n - hoge \n  - hoge"}


  # すべてファイルを読み込み
  Dir.glob "#{root}/articles/*.md" do |file|
    meta, content   = File.read(file).split("\n\n", 2)
    article         = OpenStruct.new YAML.load(meta)
    article.date    = Time.parse article.date.to_s
    article.content = content
    article.slug    = File.basename(file, '.md')
    get "/#{article.slug}" do
      # "hoge"
      erb :post, :locals => { :article => article }
    end
    articles << article
  end

  get "/" do
    erb :index
  end
end