Spree::Admin::PaymentsController.class_eval do
  after_action :payment_mail, :only => :fire

  private
  def payment_mail
    event     = params[:e]
    new_order = Spree::Order.find(@order.id)

    if event == 'capture' && new_order.payment_state == 'paid'
      Spree::PaymentMailer.payment_email(new_order).deliver_later
    end
  end
end
