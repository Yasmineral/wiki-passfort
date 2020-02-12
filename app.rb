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

  get '/documents/:title' do
    if Title.exists?(title: params[:title])
      document_id = Title.find_id(params[:title])
      entries = Revision.where(title_id: document_id)
      content = []
      entries.each { |entry| content.push(entry.content) }
      p "Revisions: " + content.join(" , ")
    else
      return status 400
    end
  end

  post '/documents/:title' do
    content = request.body.read
    Revision.create([content: content])
    

  end

  run! if app_file == $PROGRAM_NAME
end