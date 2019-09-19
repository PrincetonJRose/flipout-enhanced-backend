class AddScoreColumnToUserStats < ActiveRecord::Migration[6.0]
  def change
    add_column :user_stats, :score, :integer
  end
end
