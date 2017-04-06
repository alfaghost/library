class AddIndexToAuthorships < ActiveRecord::Migration[5.0]
  def change
    add_index :authorships, :book_id
    add_index :authorships, :author_id
    add_index :authorships, [:book_id, :author_id], unique: true
  end
end
