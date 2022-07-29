# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :tenant
  before_save :calculate_total
  belongs_to :property

  enum paymentmode: %i[bank cash bkash nagad rocket cellfin]
  enum status: %i[due paid]

  def calculate_total
    renttotal = rent + gassbill + lightbill + servicecharge + othercharges
    self.total = renttotal
  end

  validates :rent, presence: true
  validates :duedate, presence: true
  validates :paymentdate, presence: true
end
