class Category < ApplicationRecord
  default_scope { order("name ASC") }
end
