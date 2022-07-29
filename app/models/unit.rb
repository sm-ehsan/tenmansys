# frozen_string_literal: true

class Unit < ApplicationRecord
  has_many :expenses
  belongs_to :user
  belongs_to :property
  has_one :tenant, dependent: :destroy

  enum status: %i[occupied vaecent]

  scope :occupied, -> { where(status: 0) }
  scope :vacent, -> { where(status: 1) }

  validates :name, presence: true
end
