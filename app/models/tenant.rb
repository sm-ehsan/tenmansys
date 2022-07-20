class Tenant < ApplicationRecord
  has_many :rents, dependent: :destroy
  belongs_to :user
  belongs_to :property
  belongs_to :unit

  enum status: [:active, :close]

  scope :status, -> { where(:active => active)}
end
