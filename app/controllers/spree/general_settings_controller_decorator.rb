Spree::HomeController.class_eval do
  def specific_commercial_transaction
    @store = Spree::Store.where(default: true).first
  end
end
