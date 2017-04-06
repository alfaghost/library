class Book < ApplicationRecord
  belongs_to :user

  default_scope { order("id DESC") }
end
