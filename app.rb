require 'sinatra'
require 'sinatra/activerecord'

require './lib/title'
require './lib/revision'


class Wiki < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database_file, 'config/database.yml'

get '/documents' do
  
end


  run! if app_file == $PROGRAM_NAME
end