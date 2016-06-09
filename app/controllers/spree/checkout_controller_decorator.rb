Spree::CheckoutController.class_eval do
  before_action :update_payment_method_fee

  private
  def update_payment_method_fee
    if @order.state == 'confirm' # 'checkout/payment'の後に
      @order.adjustments.where(label: Spree.t(:payment_method_fee)).destroy_all # 存在する決済手数料のadjusutmentsを削除し
      amount = @order.payments.valid.first.payment_method.preferred_payment_method_fee # 決済手数料のpreferenceを呼び出し
      Spree::Adjustment.create(label: Spree.t(:payment_method_fee), adjustable: @order, order: @order, amount: amount) if amount && amount != 0 #　Spree::Adjusutmentを作る
      @order.update_totals # 注文情報も忘れずにアップデート
      @order.persist_totals # これらを忘れると@order.totalの値がおかしなことになります
    end
  end
end
