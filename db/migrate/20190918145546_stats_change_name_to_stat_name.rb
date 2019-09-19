class StatsChangeNameToStatName < ActiveRecord::Migration[6.0]
  def change
    rename_column :stats, :name, :stat_name
  end
end
