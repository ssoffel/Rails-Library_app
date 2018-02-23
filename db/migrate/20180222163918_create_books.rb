class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :year
      t.string :category
      t.text :description 
      t.timestamps
    end
    add_index :books, :title
    add_index :books, :author
  end
end
