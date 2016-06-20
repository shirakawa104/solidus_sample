Spree::Address.class_eval do
  def full_name
    "#{lastname} #{firstname}".strip
    #if config.i18n.default_locale == :ja
    #  "#{lastname} #{firstname}".strip
    #else
    #  "#{firstname} #{lastname}".strip
    #end
  end
end
