class RemoveThanksMailFromSpreeStores < ActiveRecord::Migration
  def change
    remove_column :spree_stores, :thanks_mail, :text
  end
end
