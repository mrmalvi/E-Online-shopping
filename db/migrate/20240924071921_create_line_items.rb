class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.bigint :cart_id
      t.bigint :order_id
      t.bigint :product_id
      t.bigint :product_variant_id
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
