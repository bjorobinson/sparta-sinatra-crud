require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/song_controller.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/remix_controller.rb'

use Rack::MethodOverride

run Rack::Cascade.new([
  RemixController,
  SongController,
  StaticController
])
