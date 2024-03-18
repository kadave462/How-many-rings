class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :release_year
      t.text :description
      t.string :cover
      t.string :genre
      t.string :platform
      t.string :publisher
      t.integer :ean

      t.timestamps
    end
  end
end
