class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :authors

  default_scope { order("id DESC") }
end
