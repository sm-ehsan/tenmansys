class Property < ApplicationRecord
  has_many :units
  belongs_to :user

  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end
