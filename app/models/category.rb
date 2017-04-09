class Category < ApplicationRecord
  has_many :categorizations, :dependent => :destroy
  has_many :books, :through => :categorizations
  validates :name, presence: true

  default_scope { order("name ASC") }
end
