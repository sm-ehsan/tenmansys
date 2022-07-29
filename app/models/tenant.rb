# frozen_string_literal: true

class Tenant < ApplicationRecord
  has_many :expenses
  has_many :rents, dependent: :destroy
  belongs_to :user
  belongs_to :property
  belongs_to :unit

  enum status: %i[active close]

  scope :status, -> { where(active:) }

  def country_name
    country = self.country
    ISO3166::Country[country]
  end

  validates :name, presence: true
end
