class Book < ApplicationRecord
  belongs_to :user
  has_many :authorships, :dependent => :destroy
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :authors, :through => :authorships
  accepts_nested_attributes_for :authors

  default_scope { order("id DESC") }

  def add_author!(author)
    authorships.create(book_id: author.id)
  end

  def remove_author!(author)
    authorships.find_by(book_id: author.id).destroy!
  end

  def has_authors?
    authorships.find_by(book_id: author.id)
  end

end
