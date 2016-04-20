class CreateArticleCompanyRelationships < ActiveRecord::Migration
  def change
    create_table :article_company_relationships do |t|
      t.references :article, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
