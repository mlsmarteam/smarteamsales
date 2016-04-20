class ChangeNameAColumnToArticles < ActiveRecord::Migration
   def self.up
     rename_column :articles, :sales_amount, :sale_amount
   end

   def self.down

   end
end
