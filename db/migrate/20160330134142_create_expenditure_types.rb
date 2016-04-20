class CreateExpenditureTypes < ActiveRecord::Migration
  def change
    create_table :expenditure_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
