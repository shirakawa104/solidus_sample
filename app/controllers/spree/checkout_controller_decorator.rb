Spree::CheckoutController.class_eval do
  before_action :update_payment_method_fee

  private
  def update_payment_method_fee
    if @order.state == 'confirm'
      # 代引き手数料があれば足す。
      @order.adjustments.where(label: Spree.t(:collect_delivery_fee)).destroy_all # 存在する決済手数料のadjusutmentsを削除し
      if @order.payments.valid.first.payment_method.is_a?(Spree::PaymentMethod::SolidusJapaneseCollectDelivery)
        amount = @order.payments.valid.first.payment_method.preferred_amount # 決済手数料のpreferenceを呼び出し
        Spree::Adjustment.create(label: Spree.t(:collect_delivery_fee), adjustable: @order, order: @order, amount: amount) if amount && amount != 0 #　Spree::Adjusutmentを作る
      end

      @order.update_totals
      @order.persist_totals
    end
  end
end
