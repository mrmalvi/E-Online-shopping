class RazorpayClient

  def self.verify_payment_signature?(attributes)
    payment_response = {
       razorpay_order_id: attributes.dig(:razorpay_order_id), #'order_IEIaMR65cu6nz3'
       razorpay_payment_id: attributes.dig(:razorpay_payment_id), #'pay_IH4NVgf4Dreq1l'
       razorpay_signature: attributes.dig(:razorpay_signature) #'0d4e745a1838664ad6c9c9902212a32d627d68e917290b0ad5f08ff4561bc50f'
    }
    Razorpay::Utility.verify_payment_signature(payment_response)
  end

  def self.fetch_payment(payment_id)
    Razorpay::Payment.fetch(payment_id).attributes
  end

  def self.fetch_notes(payment_id)
    fetch_payment(payment_id).dig('notes')
  end

  def self.create_order(totol_price, user_id, cart_id)
    para_attr = {
      "amount": totol_price.to_i * 100,
      "currency": "INR",
      "receipt": "receipt#1",
      "notes": {
        "customer_id": user_id,
        "cart_id": cart_id
      }
    }
    Razorpay::Order.create(para_attr).attributes
  end
end
