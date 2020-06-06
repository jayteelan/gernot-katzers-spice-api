class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.references :spice, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
