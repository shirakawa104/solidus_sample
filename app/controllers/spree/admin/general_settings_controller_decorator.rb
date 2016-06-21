Spree::Admin::GeneralSettingsController.class_eval do
  before_action :permit_new_attribute

  private
  def permit_new_attribute
    Spree::PermittedAttributes.store_attributes << :specific_commercial_transaction
    Spree::PermittedAttributes.store_attributes << :thanks_mail
    Spree::PermittedAttributes.store_attributes.uniq!
  end
end
