require 'sinatra'
require 'sinatra/activerecord'

require './lib/title'
require './lib/revision'


class Wiki < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database_file, 'config/database.yml'

  get '/documents' do
    Title.display_all
  end

  get 'documents/:title' do
    title = Title.first
    Revision.create(title_id: title.id, content: "hiya")
  end

  run! if app_file == $PROGRAM_NAME
end