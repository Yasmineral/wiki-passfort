class Title < ActiveRecord::Base
  has_many :revisions
  validates :title, length: { maximum: 50 }

  def self.validate(title)
    raise 'Title invalid: exceeds 50 characters' if title.length > 50

    title
  end

  def self.display_all
    documents = Title.all
    titles = []
    documents.each { |document| titles.push(document.title) }
    display_titles = titles.map(&:capitalize).join(', ')
    'Titles: ' + display_titles
  end

  def self.find_id(title)
    title = title.split('-').join(' ')
    document = Title.find_by(title: title)
    document.id
  end

  def self.format_title(title)
    title.split('-').join(' ')
  end
end
