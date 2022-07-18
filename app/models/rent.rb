class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :tenant
  before_save :calculate_total

  enum paymentmode: [:bank, :cash, :bkash, :nagad, :rocket, :cellfin]

  def calculate_total
    renttotal = self.rent + self.gassbill + self.lightbill + self.servicecharge
    self.total = renttotal
  end

  validates :rent, presence: true
  validates :duedate, presence: true
  validates :paymentdate, presence: true
end
