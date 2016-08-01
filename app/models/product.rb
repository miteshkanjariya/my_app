class Product < ApplicationRecord
  # This defines the paypal url for a given product sale
  def paypal_url(return_url, notify_url)
  values = {
  :business => 'kapitaliz@gmail.com',
  :cmd => '_cart',
  :upload => 1,
  :return => return_url,
  :invoice => SecureRandom.uuid
  }

  values.merge!({
  "amount_1" => unit_price,
  "item_name_1" => name,
  "item_number_1" => id,
  "quantity_1" => '1'
  })

  # This is a paypal sandbox url and should be changed for production.
  # Better define this url in the application configuration setting on environment
  # basis.
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
