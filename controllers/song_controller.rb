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

    # root
    get '/' do
      "Root"
    end

    # new
    get '/new' do
      "New"
    end

    # show
    get '/:id' do
      "Show"
    end

    # create
    put '/:id' do
      "Create"
    end

    # delete
    delete '/:id' do
      "Delete"
    end

    # edit
    get '/:id/edit' do
      "edit"
    end
  end
