class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.text :name

      t.timestamps
    end
  end
end
