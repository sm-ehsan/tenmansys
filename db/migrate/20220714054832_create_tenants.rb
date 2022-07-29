# frozen_string_literal: true

class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :nid
      t.string :email
      t.string :mobile
      t.string :peraddrline1
      t.string :peraddrline2
      t.string :peraddrline3
      t.string :zipcode
      t.string :city
      t.string :country
      t.date :entrydate
      t.date :exitdate
      t.decimal :rentpermonth
      t.decimal :advancepaid
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
