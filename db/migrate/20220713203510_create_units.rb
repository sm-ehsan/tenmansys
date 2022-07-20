class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :bedroom
      t.integer :bathroom
      t.boolean :drawingroom
      t.boolean :dining
      t.integer :kitchen
      t.integer :status
      t.string :elecmetno
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
