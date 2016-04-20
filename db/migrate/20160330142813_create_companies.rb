class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cuit
      t.string :street
      t.string :number
      t.integer :floor
      t.string :apartment
      t.references :city, index: true, foreign_key: true
      t.string :fixed_tel
      t.string :cel_tel
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
