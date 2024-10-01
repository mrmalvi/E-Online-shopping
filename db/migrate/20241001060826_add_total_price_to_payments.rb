class AddTotalPriceToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :total_price, :float
    add_column :line_items, :status, :string, default: "pending"
  end
end
