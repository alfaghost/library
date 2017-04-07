class Category < ApplicationRecord
  has_many :categorizations, :dependent => :destroy
  has_many :books, :through => :categorizations


  default_scope { order("name ASC") }
end
