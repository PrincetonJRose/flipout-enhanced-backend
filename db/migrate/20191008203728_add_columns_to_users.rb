class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fewest_misses, :integer, default: 0
    add_column :users, :best_combo, :integer, default: 0
    add_column :users, :games_played, :integer, default: 0
  end
end
