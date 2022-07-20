class Unit < ApplicationRecord
  belongs_to :user
  belongs_to :property

  enum status: [:occupied, :vaecent]
  
  scope :vacent, -> { where(:status => false)}
  scope :occupied, -> { where(:status => true)}
end
