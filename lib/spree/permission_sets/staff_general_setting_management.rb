module Spree
  module PermissionSets
    class StaffGeneralSettingManagement < PermissionSets::Base
      def activate!
        can :manage, :general_settings
        cannot :manage, Spree::Country
        cannot :manage, Spree::State
        cannot :manage, Spree::Taxon
        cannot :display, Spree::Taxon
        cannot :manage, Spree::Taxonomy
        cannot :display, Spree::Taxonomy
        cannot :manage, Spree::StockLocation
        cannot :manage, Spree::Reimbursement
        cannot :display, Spree::Reimbursement
        cannot :manage, Spree::ReimbursementType
        cannot :display, Spree::ReimbursementType
        cannot :manage, Spree::Zone
      end
    end
  end
end
