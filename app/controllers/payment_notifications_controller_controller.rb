class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
    Rails.logger.debug("*******************got pay-pal notification************************")
    PaymentNotification.create!(:params => params, :status => params[:payment_status], :transaction_id => params[:txn_id] )
    render :nothing => true
  end

end
