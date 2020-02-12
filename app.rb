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
    title = Title.format_title(params[:title])
    if Title.where(:title => title).blank?
      return status 400
    else
      document_id = Title.find_id(params[:title])
      entries = Revision.where(title_id: document_id)
      content = []
      entries.each { |entry| content.push(entry.content) }
      p 'Revisions: ' + content.join(' , ')
  end
end

  post '/documents/:title' do
    content = request.body.read
    title = Title.format_title(params[:title])
    document_id = Title.find_id(title)
    Revision.create([content: content, title_id: document_id])
    p 'revision created!'
  end

  run! if app_file == $PROGRAM_NAME
end
