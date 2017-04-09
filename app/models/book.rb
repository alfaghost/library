class Book < ApplicationRecord
  has_many :authorships, :dependent => :destroy
  has_many :categorizations, :dependent => :destroy
  has_many :categories, :through => :categorizations
  has_many :authors, :through => :authorships

  accepts_nested_attributes_for :authors


  has_attached_file :image, styles: { large: '320x380>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  default_scope { order("id DESC") }

end
