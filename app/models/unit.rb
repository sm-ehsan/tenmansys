class Unit < ApplicationRecord
  has_many :expenses
  belongs_to :user
  belongs_to :property

  enum status: [:occupied, :vaecent]
  
  scope :occupied, -> { where(:status => 0)}
  scope :vacent, -> { where(:status => 1)}

  validates :name, presence: true
end
