require 'spec_helper'

describe Merchant do

	describe 'valid merchant?' do
		it 'requires valid name and address for merchant' do
			m = Merchant.create
			m.should have_errors_on(:name).with_message("can't be blank")
			m = Merchant.create(name: "Test name")
			m.should have_errors_on(:address).with_message("can't be blank")
			m = Merchant.create(address: "Test name")
			m.should have_errors_on(:name).with_message("can't be blank")
		end
	end
end