class Category < ActiveRecord::Base
  has_many :forums
  attr_accessible :name, :position

  validates :name, presence: true
  validates :position, numericality: { only_integer: true ,greater_than_or_equal_to: 0}
end
  