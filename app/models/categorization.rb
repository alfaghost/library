class Categorization < ApplicationRecord
  belongs_to :book, :dependent => :destroy
  belongs_to :category, :dependent => :destroy
end
