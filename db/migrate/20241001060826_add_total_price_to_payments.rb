class AddTotalPriceToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :total_price, :float
    add_column :line_items, :status, :string, default: "pending"
    add_column :carts, :status, :string, default: "activated"
  end
end
