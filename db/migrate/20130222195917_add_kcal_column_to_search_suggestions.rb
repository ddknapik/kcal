class AddKcalColumnToSearchSuggestions < ActiveRecord::Migration
  def change
  	add_column :search_suggestions, :kcal, :integer
  end
end
