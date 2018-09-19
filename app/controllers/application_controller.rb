
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    #binding.pry
    redirect "/posts"
  end

  get '/posts' do
    @posts = Post.all
    #binding.pry
    erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    #binding.pry
    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    #binding.pry
    erb :show
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect "posts/#{@post.id}"
  end

  get '/posts/:id/delete' do
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.delete
    redirect :delete
  end


end
