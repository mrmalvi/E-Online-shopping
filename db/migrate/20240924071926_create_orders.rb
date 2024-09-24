class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.float :total_price
      t.string :status, default: :pending

      t.timestamps
    end
  end
end
