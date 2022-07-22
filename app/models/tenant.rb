class Tenant < ApplicationRecord
  has_many :expenses
  has_many :rents, dependent: :destroy
  belongs_to :user
  belongs_to :property
  belongs_to :unit

  enum status: [:active, :close]

  scope :status, -> { where(:active => active)}

  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end
