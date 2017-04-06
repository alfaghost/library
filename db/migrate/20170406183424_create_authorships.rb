class CreateAuthorships < ActiveRecord::Migration[5.0]
  def change
    create_table :authorships do |t|

      t.timestamps
    end
  end
end
