class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps null: false
    end
  end
end
