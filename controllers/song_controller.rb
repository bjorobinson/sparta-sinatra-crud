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

  end

  # show
  get '/songs/:id' do
    id = params[:id].to_i
    @song = $songs[id]
    erb :'songs/show'
  end

  # create
  put '/songs/:id' do
    "Create"
  end

  # delete
  delete '/songs/:id' do
    "Delete"
  end

  # edit
  get '/songs/:id/edit' do
    "edit"
  end
end
