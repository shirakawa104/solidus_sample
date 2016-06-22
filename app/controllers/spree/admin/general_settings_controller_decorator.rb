Spree::Admin::GeneralSettingsController.class_eval do
  before_action :permit_new_attribute

  private
  def permit_new_attribute
    Spree::PermittedAttributes.store_attributes << :specific_commercial_transaction
    Spree::PermittedAttributes.store_attributes << :confirm_mail
    Spree::PermittedAttributes.store_attributes << :cancel_mail
    Spree::PermittedAttributes.store_attributes << :shipment_mail
    Spree::PermittedAttributes.store_attributes << :payment_mail
    Spree::PermittedAttributes.store_attributes << :mail_footer
    Spree::PermittedAttributes.store_attributes.uniq!
  end
end
