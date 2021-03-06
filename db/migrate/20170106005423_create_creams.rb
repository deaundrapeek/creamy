class CreateCreams < ActiveRecord::Migration[5.0]
  def change
    create_table :creams do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.integer :size
      t.string :notes
      t.integer :times_purchased, default: 1
      t.integer :format_id
      t.boolean :favorite, default: false
      t.boolean :current_rotation, default: false

      t.timestamps
    end
  end
end
