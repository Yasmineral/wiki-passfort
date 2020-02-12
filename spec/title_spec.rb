require 'title'
require 'database_helper'

describe Title do
  describe '.validate' do
    it 'must be under 50 characters long' do
      expect { Title.validate('a' * 100) }.to raise_error 'Title invalid: exceeds 50 characters'
    end
  end
  describe '.display_all' do
    it 'returns all available titles' do
      connect_to_database
      expect(Title.display_all).to include('Titles: History of science, History of literature, History of art')
    end
  end
  describe '.format_title' do
    it 're-formats the title param into searchable text' do
      title = Title.format_title('history-of-science')
      expect(title).to eq('history of science')
    end
  end
end
