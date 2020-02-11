require 'sinatra'
require 'sinatra/activerecord'

class Wiki < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database_file, 'config/database.yml'



  
  run! if app_file == $PROGRAM_NAME
end