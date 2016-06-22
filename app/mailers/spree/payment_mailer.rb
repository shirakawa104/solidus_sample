module Spree
  class PaymentMailer < BaseMailer
    def payment_email(order, resend = false)
      @order = find_order(order)
      @store = @order.store
      subject = build_subject(Spree.t('payment_mailer.payment_email.subject'), resend)
      mail(to: @order.email, from: from_address(@store), subject: subject)
    end

    private
    def find_order(order)
      if order.respond_to?(:id)
        order
      else
        ActiveSupport::Deprecation.warn("Calling PaymentMailer with an id is deprecated. Pass the Spree::Order object instead.")
        Spree::Order.find(order)
      end
    end

    def build_subject(subject_text, resend)
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{Spree::Store.current.name} #{subject_text} ##{@order.number}"
    end
  end
end
