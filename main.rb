     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'bcrypt'

require_relative 'db/db'


# require_relative 'models/characters'
require_relative 'models/user'

require_relative 'controllers/characters_controllers'
require_relative 'controllers/sessions_controllers'
require_relative 'controllers/users_controllers'




