require 'spec_helper'

describe Purchase do
	describe 'valid purchase?' do
		it 'requires purchases have items, and customers' do
			p = Purchase.create
			p.should have_errors_on(:item_id).with_message("can't be blank")
			p.should have_errors_on(:import_id).with_message("can't be blank")
			p.should have_errors_on(:customer_id).with_message("can't be blank")
		end
	end
end