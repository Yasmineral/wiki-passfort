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
    title = params[:title].split("-").join(" ")
    document = Title.find_by(title: title)
    document_id = document.id
    entries = Revision.where(title_id: document_id)
    content = []
    entries.each { |entry| content.push(entry.content) }
    "Revisions: " + content.join(", ")
  end

  run! if app_file == $PROGRAM_NAME
end