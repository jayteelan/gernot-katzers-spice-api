class CreateConstituents < ActiveRecord::Migration[6.0]
  def change
    create_table :constituents do |t|
      t.references :spice, null: false, foreign_key: true
      t.string :compound
      t.string :description

      t.timestamps
    end
  end
end
