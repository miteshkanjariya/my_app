class PaymentNotificationsController < ApplicationController
  protect_from_forgery except: [:create]
  def create
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      puts "************************paypal-notification*************************"
    end
    render nothing: true
  end

end
