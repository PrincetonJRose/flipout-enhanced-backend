class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.text :name
      t.text :image_url

      t.timestamps
    end
  end
end
