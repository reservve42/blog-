require 'sinatra'
require 'yaml'


def load_posts
  YAML.load_file('posts.yml')
end

get '/' do
  @posts = load_posts
  erb :index
end

get '/post/:id' do
  @post = load_posts.find { |p| p['id'] == params[:id].to_i }
  halt 404, "Post not found" unless @post
  erb :post
end
