require "spec_helper"

describe Wiki do
  include Rack::Test::Methods

  let (:app) { Wiki.new }

  context 'GET /documents/:title' do
    it 'returns status 400 if an unkown title is provided' do
      get '/documents/test'
      expect(last_response.status).to eq 400
    end
  end
  context 'POST /documents/:title' do
    it 'returns status 200 OK' do
      post '/documents/history-of-science'
      expect(last_response.status).to eq 200
    end
  end
end