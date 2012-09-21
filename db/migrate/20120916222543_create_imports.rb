class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :filename
      t.text :content

      t.timestamps
    end
  end
end
