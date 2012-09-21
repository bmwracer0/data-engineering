require 'spec_helper'

describe Customer do
	describe 'valid customer?' do
		it 'requires customer name' do
			c = Customer.create
			c.should have_errors_on(:name).with_message("can't be blank")
		end
	end
end