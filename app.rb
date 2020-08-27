require 'sinatra/base'
require './lib/bookmarks'
require 'pg'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do

    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post '/add' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete( id: params['id'])
    redirect '/bookmarks'
    
  end

  

  run! if app_file == $0

end
