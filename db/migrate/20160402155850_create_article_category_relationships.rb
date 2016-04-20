class CreateArticleCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :article_category_relationships do |t|
      t.references :article, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
