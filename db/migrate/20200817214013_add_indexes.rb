class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, :author_id
  end
end
