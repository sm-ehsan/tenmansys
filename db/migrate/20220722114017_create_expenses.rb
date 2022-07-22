class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.date :paymentdate
      t.date :billmonth
      t.string :name
      t.decimal :amount, precision: 8, scale: 2
      t.text :note
      t.references :user, null: false, foreign_key: true
      t.references :tenant, foreign_key: true
      t.references :unit, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
