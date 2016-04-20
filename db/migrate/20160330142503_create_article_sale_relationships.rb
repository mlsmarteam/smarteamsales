class CreateArticleSaleRelationships < ActiveRecord::Migration
  def change
    create_table :article_sale_relationships do |t|
      t.references :article, index: true, foreign_key: true
      t.references :sale, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
