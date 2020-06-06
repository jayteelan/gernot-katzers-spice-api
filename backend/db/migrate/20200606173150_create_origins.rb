class CreateOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :origins do |t|
      t.references :spice, null: false, foreign_key: true
      t.string :area

      t.timestamps
    end
  end
end
