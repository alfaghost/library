class Book < ApplicationRecord
  belongs_to :user
  has_many :authorships
  has_many :authors, :through => :authorships

  default_scope { order("id DESC") }
end
