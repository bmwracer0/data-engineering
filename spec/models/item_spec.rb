require 'spec_helper'

describe Item do
	describe 'valid item?' do
		it 'requires items have valid merchant, description and prices' do
			i = Item.create
			i.should have_errors_on(:price).with_message("can't be blank")
			i = Item.create(price: 5)
			i.should have_errors_on(:description).with_message("can't be blank")
			i = Item.create(price: 5, description: "Test")
			i.should have_errors_on(:merchant_id).with_message("can't be blank")
		end
	end
end