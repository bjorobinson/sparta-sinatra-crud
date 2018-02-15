class RemixController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  $remixes = [{
      id: 0,
      title: "Slow Waltz",
      body: "https://www.youtube.com/watch?v=k4JpyxSVRMk"
    },
    {
      id: 1,
      title: "Jive",
      body: "https://www.youtube.com/watch?v=FfJ_8rWwZ3g"
    },
    {
      id: 2,
      title: "Vienesse Waltz",
      body: "https://www.youtube.com/watch?v=fPKsWuiPAao"
  }]

  # index
  get '/remixes' do
    @remixes = $remixes
    @title = "remixes index"
    erb :'remixes/index'
  end


  # new
  get '/remixes/new' do
    erb :'remixes/new'
  end

  # create

  post '/remixes' do
    puts params

    new_remix = {
      title: params[:title],
      body: params[:body]
    }

    $songs.push new_remix

    redirect "/remix"
  end

  # show
  get '/remixes/:id' do
    id = params[:id].to_i
    @remix = $remixes[id]
    erb :'remixes/show'
  end

  # delete
  delete '/remixes/:id' do
    id = params[:id].to_i
    $remixes.delete_at(id)
    redirect '/remixes'
  end

  # edit
  get '/remixes/:id/edit' do
    id = params[:id].to_i
    @remix = $remixes[id]
    erb :'remixes/edit'
  end

  # update
  put '/remixes/:id'  do

    id = params[:id].to_i
    remix = $remixes[id]
    remix[:title] = params[:title]
    remix[:body] = params[:body]

    $remixes[id] = song

    redirect '/remixes'

  end
end
