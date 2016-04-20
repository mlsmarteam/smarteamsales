class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.references :expenditure_type, index: true, foreign_key: true
      t.float :amount
      t.text :description
      t.datetime :date

      t.timestamps null: false
    end
  end
end
