Spree::Address.class_eval do
  def full_name
    "#{lastname} #{firstname}".strip
    #"#{firstname} #{lastname}".strip
  end
end
