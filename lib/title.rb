class Title < ActiveRecord::Base
  has_many :revisions
  validates :title, length: { maximum: 50 }

  def initialize(title)
    @title = title
  end

end