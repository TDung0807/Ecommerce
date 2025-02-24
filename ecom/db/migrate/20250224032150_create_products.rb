class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :img
      t.text :description
      t.string :sku, null: false, unique: true
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :saleprice, precision: 10, scale: 2
      t.integer :stock, default: 0

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
