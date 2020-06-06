class CreateSpices < ActiveRecord::Migration[6.0]
  def change
    create_table :spices do |t|
      t.string :name
      t.string :description
      t.string :etymology
      t.string :notes

      t.timestamps
    end
  end
end
