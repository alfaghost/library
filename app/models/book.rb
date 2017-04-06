class Book < ApplicationRecord
  belongs_to :user
  has_many :authorships
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :authors, :through => :authorships

  default_scope { order("id DESC") }
end
