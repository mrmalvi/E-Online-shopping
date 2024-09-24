class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :stock
      t.string :sku
      t.bigint :seller_id
      t.bigint :category_id

      t.timestamps
    end
  end
end
