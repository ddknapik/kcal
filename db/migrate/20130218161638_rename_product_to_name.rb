class RenameProductToName < ActiveRecord::Migration
  def up
  	rename_column :products, :product, :name
  end

  def down
  end
end
