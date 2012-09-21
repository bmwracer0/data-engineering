class Purchase < ActiveRecord::Base
    attr_accessible :count, :import_id, :item_id, :customer_id
    belongs_to :import
    belongs_to :item
    belongs_to :customer

    validates :import_id, :presence => true
    validates :item_id, :presence => true
    validates :customer_id, :presence => true

    validates :count, :presence => true
    validates_numericality_of :count, :greater_than => 0,
                            :only_integer => true


    def purchase_total
    	return 0 if item.nil? || item.price.nil?
    	   count * item.price
        end
    end

