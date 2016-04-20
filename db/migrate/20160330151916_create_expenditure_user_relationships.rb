class CreateExpenditureUserRelationships < ActiveRecord::Migration
  def change
    create_table :expenditure_user_relationships do |t|
      t.references :expenditure, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
