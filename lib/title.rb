class Title < ActiveRecord::Base
  has_many :revisions
  validates :title, length: { maximum: 50 }

  def self.validate(title)
    raise "Title invalid: exceeds 50 characters" if title.length > 50
    title
  end

  def self.display_all
    documents = Title.all
    titles = []
    documents.each { |document| titles.push((document.title).capitalize) }
    "Titles: " + titles.join(", ")
  end

  def self.find_id(title)
    title = title.split("-").join(" ")
    document = Title.find_by(title: title)
    return document.id
  end
end

