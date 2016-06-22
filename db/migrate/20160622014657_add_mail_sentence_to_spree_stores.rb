class AddMailSentenceToSpreeStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :confirm_mail, :text
    add_column :spree_stores, :cancel_mail, :text
    add_column :spree_stores, :shipment_mail, :text
    add_column :spree_stores, :payment_mail, :text
    add_column :spree_stores, :mail_footer, :text
  end
end
