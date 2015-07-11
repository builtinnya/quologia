class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :poster_id
      t.string :name,       null: false
      t.string :birthplace
      t.datetime :birthday
      t.datetime :deathday
      t.text :description

      t.timestamps null: false
    end

    add_index :authors, :poster_id
  end
end
