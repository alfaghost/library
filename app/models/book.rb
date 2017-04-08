class Book < ApplicationRecord
  belongs_to :user
  has_many :authorships, :dependent => :destroy
  has_many :categorizations, :dependent => :destroy
  has_many :categories, :through => :categorizations
  has_many :authors, :through => :authorships
  accepts_nested_attributes_for :authors

  default_scope { order("id DESC") }

  def self.find_categories(category)
    book_ids = "SELECT book_id FROM categorizations
                WHERE category_id = #{category.id}"
    where("id IN (#{book_ids})")
  end
end
