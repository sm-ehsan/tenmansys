class Tenant < ApplicationRecord
  has_many :rents, dependent: :destroy
  belongs_to :user
  belongs_to :property
  belongs_to :unit
end
