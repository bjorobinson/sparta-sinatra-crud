require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/song_controller.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/type_controller.rb'

use Rack::MethodOverride

run PostsController
