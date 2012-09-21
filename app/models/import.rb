class Import < ActiveRecord::Base
  attr_accessible :content, :filename, :file
  attr_accessor :file
  has_many :purchases

  validates :filename, :presence => true
  validates :content, :presence => true
  validate :verify_file_format

  def load
  	return if file.nil?

  	self.filename = file.original_filename
  	self.content = file.read
  end


  def import
  	load
  	return false unless save
  	
    Import.transaction do #wrap in transaction
      CSV.parse(content, headers: :first_row, :col_sep => "\t").each do |line|
        merchant = Merchant.find_or_create_by_name!(name: line['merchant name'], address: line['merchant address'])
        customer = Customer.find_or_create_by_name!(name: line['purchaser name'])
        item = Item.find_or_create_by_description_and_merchant_id!(description: line['item description'], price: line['item price'], merchant_id: merchant.id)
        Purchase.create!(count: line['purchase count'], customer_id: customer.id, item_id: item.id, import_id: id)
      end
    end
        
  end

  def total_price
  	total = 0
  	purchases.each { |purchase| total += purchase.purchase_total}
  	total
  end

  def verify_file_format
    return if content.nil?

    header = content.split("\n").first
    headers = header.split("\t")
    unless (headers & ["purchaser name", "item description", "item price", "purchase count", "merchant address", "merchant name"]).count == 6
      #check for array intersection for required headers. if intersection is not all 6 headers, something is invalid
      errors.add(:content, "#{filename} has invalid/missing/too many headers.")
    end
  end
end
