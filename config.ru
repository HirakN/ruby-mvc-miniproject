require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require "pry"
require_relative "./models/shark.rb"
require_relative "./controllers/sharks_controller.rb"


use Rack::Reloader
use Rack::MethodOverride

run SharksController