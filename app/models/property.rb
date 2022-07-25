class Property < ApplicationRecord
  has_many :expenses
  has_many :tenants
  has_many :units
  belongs_to :user
  has_many :rents

  def country_name
    country = self.country
    ISO3166::Country[country]
  end

  validates :name, presence: true
  validates :landlord, presence: true
end
