class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :poster_id
      t.string :author_name,  null: false
      t.string :content,      null: false
      t.string :author_image

      t.timestamps null: false
    end

    add_index :quotes, :poster_id
  end
end
