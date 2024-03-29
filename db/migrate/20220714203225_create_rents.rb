# frozen_string_literal: true

class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.date :rentmonth
      t.date :duedate
      t.date :paymentdate
      t.decimal :rent, precision: 8, scale: 2
      t.decimal :gassbill, precision: 8, scale: 2
      t.decimal :lightbill, precision: 8, scale: 2
      t.decimal :waterbill, precision: 8, scale: 2
      t.decimal :servicecharge, precision: 8, scale: 2
      t.integer :status
      t.integer :paymentmode
      t.string :bankname
      t.string :accountnumber
      t.string :refnumber
      t.decimal :total, precision: 8, scale: 2
      t.decimal :othercharges, precision: 8, scale: 2
      t.text :note
      t.references :user, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
