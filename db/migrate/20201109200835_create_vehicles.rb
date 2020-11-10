class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :car
      t.string :brand
      t.integer :year
      t.text :description
      t.boolean :sold

      t.timestamps
    end
  end
end
