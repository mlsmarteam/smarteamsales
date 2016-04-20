class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :doc_type, index: true, foreign_key: true
      t.string :doc_number
      t.string :name
      t.string :last_name
      t.string :street
      t.string :number
      t.string :floor
      t.string :apartment
      t.references :city, index: true, foreign_key: true
      t.string :fixed_tel
      t.string :cel_tel
      t.string :email
      t.string :cuil
      t.datetime :birthdate

      t.timestamps null: false
    end
  end
end
