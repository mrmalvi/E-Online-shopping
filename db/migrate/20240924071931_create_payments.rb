class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.bigint :order_id
      t.string :payment_method
      t.text :payment_details
      t.string :status

      t.timestamps
    end
  end
end
