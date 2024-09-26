class AddCartIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :cart_id, :bigint
  end
end
