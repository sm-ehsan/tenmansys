class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :tenant

  enum paymentmode: [:bank, :cash, :bkash, :nagad, :rocket, :cellfin]

  def renttotal
    self.rent.to_s.to_d + self.gassbill.to_s.to_d + self.lightbill.to_s.to_d + self.servicecharge.to_s.to_d
  end

  validates :rent, presence: true
  validates :duedate, presence: true
  validates :paymentdate, presence: true
end
