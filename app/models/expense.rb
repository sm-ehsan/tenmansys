# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :tenant, optional: true
  belongs_to :unit, optional: true
  belongs_to :property, optional: true

  validates :paymentdate, presence: true
end
