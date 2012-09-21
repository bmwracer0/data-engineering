require 'factory_girl'

FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant ##{n}" }
    address "Sample Address"
  end

  factory :item do
    sequence(:description) { |n| "Item ##{n}" }
    merchant
    price 25.0
  end

  factory :customer do
    sequence(:name) { |n| "Customer ##{n}" }
  end

  factory :purchase do
    item
    import
    count 2
  end

  factory :import do
    sequence(:file_name) { |n| "Import ##{n}" }
    content "customer name"
  end
end