class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.date :rentmonth
      t.date :duedate
      t.date :paymentdate
      t.decimal :rent, precision: 8, scale: 2
      t.decimal :gassbill, precision: 8, scale: 2
      t.decimal :lightbill, precision: 8, scale: 2
      t.decimal :servicecharge, precision: 8, scale: 2
      t.boolean :status
      t.integer :paymentmode
      t.string :bankname
      t.string :accountnumber
      t.string :refnumber
      t.decimal :total, precision: 8, scale: 2
      t.references :user, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
