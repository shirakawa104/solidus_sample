class AddSpecificCommercialTransactionToSpreeStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :specific_commercial_transaction, :text
    add_column :spree_stores, :thanks_mail, :text
  end
end
