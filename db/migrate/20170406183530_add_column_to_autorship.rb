class AddColumnToAutorship < ActiveRecord::Migration[5.0]
  def change
    add_column :authorships, :book_id, :integer
    add_column :authorships, :author_id, :integer
  end
end
