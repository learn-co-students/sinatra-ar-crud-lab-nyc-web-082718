
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
    @p = Post.create(params)
    erb :posts
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id' do
    @id = params[:id]
    erb :show
  end

  get '/posts/:id/edit' do
    @id = params[:id]
    erb :update
  end

  patch '/posts/:id' do
    @id = params[:id].to_i
    Post.find(@id).update(name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do
    @id = params[:id].to_i
    Post.find(@id).destroy
    erb :posts
  end

end
