class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :count
      t.integer :customer_id
      t.integer :item_id
      t.integer :import_id

      t.timestamps
    end
  end
end
