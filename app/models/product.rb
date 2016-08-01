class Product < ApplicationRecord
  # #This defines the paypal url for a given product sale
  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
        business: "kapitaliz@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: SecureRandom.uuid,
        amount: unit_price,
        item_name: name,
        item_number: id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/payment_notification"
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
