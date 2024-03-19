class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.date :adding_date
      t.integer :price
      t.boolean :on_sale
      t.string :media_condition
      t.string :cover_condition
      t.string :box_condition
      t.string :manual_condition
      t.text :description

      t.timestamps
    end
  end
end
