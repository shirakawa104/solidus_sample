Spree::Country.class_eval do
  has_many :states, ->{ order('id ASC') }

end
