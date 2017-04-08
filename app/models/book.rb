class Book < ApplicationRecord
  has_many :authorships, :dependent => :destroy
  has_many :categorizations, :dependent => :destroy
  has_many :categories, :through => :categorizations
  has_many :authors, :through => :authorships
  accepts_nested_attributes_for :authors

  default_scope { order("id DESC") }

end
