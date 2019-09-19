class CreateUserStats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stats do |t|
      t.integer :user_id
      t.integer :stat_id

      t.timestamps
    end
  end
end
