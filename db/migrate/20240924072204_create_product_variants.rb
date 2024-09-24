class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants do |t|
      t.bigint :product_id
      t.string :size
      t.string :color
      t.integer :stock

      t.timestamps
    end
  end
end
