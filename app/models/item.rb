class Item < ActiveRecord::Base
  attr_accessible :description, :merchant_id, :price

  belongs_to :merchant
  validates :price, :presence => true
  validates :description, :presence => true
  validates :merchant_id, :presence => true

  validates :price, :presence => true
  validates_numericality_of :price, :greater_than => 0

end
