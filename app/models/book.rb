class Book < ApplicationRecord
  has_many :authorships, :dependent => :destroy
  has_many :categorizations, :dependent => :destroy
  has_many :categories, :through => :categorizations
  has_many :authors, :through => :authorships

  accepts_nested_attributes_for :authors

  validates :name, presence: true

  has_attached_file :image,
                    :default_url => "missing_cover.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  default_scope { order("id DESC") }

  def self.find_categories(category)
    book_ids = "SELECT book_id FROM categorizations
                WHERE category_id = #{category.id}"
    where("id IN (#{book_ids})")
  end
end
