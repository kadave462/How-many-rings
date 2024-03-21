class AddAveragePriceToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :average_price, :float
  end
end
