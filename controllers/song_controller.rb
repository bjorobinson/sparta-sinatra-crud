class SongController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  $songs = [{
      id: 0,
      title: "Day One",
      body: "From Interstellar OST"
    },
    {
      id: 1,
      title: "Tainted Love",
      body: "Originally by Soft Cell"
    },
    {
      id: 2,
      title: "Domestic Pressures",
      body: "From Theory of Everything OST"
  }]

  # index
  get '/songs' do
    @songs = $songs
    @title = "Songs index"
    erb :'songs/index'
  end


  # new
  get '/songs/new' do
    erb :'songs/new'
  end

  # create

  post '/songs' do
    puts params

    new_song = {
      title: params[:title],
      body: params[:body]
    }

    $songs.push new_song

    redirect "/songs"
  end

  # show
  get '/songs/:id' do
    id = params[:id].to_i
    @song = $songs[id]
    erb :'songs/show'
  end

  # delete
  delete '/songs/:id' do
    "Delete"
  end

  # edit
  get '/songs/:id/edit' do
    id = params[:id].to_i
    @song = $songs[id]
    erb :'songs/edit'
  end

  # update
  put '/songs/:id'  do

    id = params[:id].to_i
    song = $songs[id]
    song[:title] = params[:title]
    song[:body] = params[:body]

    $songs[id] = song

    redirect '/songs'

  end
end
