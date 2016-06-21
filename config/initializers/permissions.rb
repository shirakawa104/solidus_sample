Spree::RoleConfiguration.configure do |config|
  config.assign_permissions :staff, [
    Spree::PermissionSets::DashboardDisplay,
    Spree::PermissionSets::OrderDisplay,
    Spree::PermissionSets::OrderManagement,
    Spree::PermissionSets::ProductDisplay,
    Spree::PermissionSets::ProductManagement,
    Spree::PermissionSets::ReportDisplay
  ]
end
