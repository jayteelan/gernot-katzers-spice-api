class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.references :spice, null: false, foreign_key: true
      t.string :part

      t.timestamps
    end
  end
end
