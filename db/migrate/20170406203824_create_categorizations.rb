class CreateCategorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :categorizations do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps
    end
    add_index :categorizations, :book_id
    add_index :categorizations, :category_id
    add_index :categorizations, [:book_id, :category_id], unique: true
  end
end
