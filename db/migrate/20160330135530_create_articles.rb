class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :barcode
      t.float :purchase_amount
      t.float :sales_amount
      t.integer :min_stock
      t.integer :max_stock
      t.integer :quantity
      t.references :mark, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
