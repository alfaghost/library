class Author < ApplicationRecord
  has_many :authorships
  has_many :books, :through => :authorships
  default_scope { order("name ASC") }
end
