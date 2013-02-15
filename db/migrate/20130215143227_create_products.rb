class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product
      t.string :unit
      t.integer :kcal

      t.timestamps
    end
  end
end
