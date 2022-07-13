class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :landlord
      t.text :description
      t.string :addrline1
      t.string :addrline2
      t.string :zipcode
      t.string :city
      t.string :country
      t.references :user, null: false, foreign_key: true
      t.string :contactno

      t.timestamps
    end
  end
end
