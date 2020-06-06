class CreateSpiceConstituents < ActiveRecord::Migration[6.0]
  def change
    create_table :spice_constituents do |t|
      t.references :spice, null: false, foreign_key: true
      t.references :constituent, null: false, foreign_key: true
      t.string :amount

      t.timestamps
    end
  end
end
