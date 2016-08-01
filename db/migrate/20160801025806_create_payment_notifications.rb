class CreatePaymentNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_notifications do |t|
      t.text :params
      t.string :status
      t.string :transaction_id

      t.timestamps
    end
  end
end
