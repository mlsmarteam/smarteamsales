class CreateUserTurnRelationships < ActiveRecord::Migration
  def change
    create_table :user_turn_relationships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :turn, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
