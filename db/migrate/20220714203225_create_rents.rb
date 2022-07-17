class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.date :rentmonth
      t.date :duedate
      t.date :paymentdate
      t.decimal :rent
      t.decimal :gassbill
      t.decimal :lightbill
      t.decimal :servicecharge
      t.boolean :status
      t.integer :paymentmode
      t.string :bankname
      t.string :accountnumber
      t.string :refnumber
      t.references :user, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
