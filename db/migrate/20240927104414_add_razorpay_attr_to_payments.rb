class AddRazorpayAttrToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :external_payment_id, :string
    add_column :payments, :external_order_id, :string
  end
end
