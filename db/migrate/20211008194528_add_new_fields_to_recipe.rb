class AddNewFieldsToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :prepare_mode, :text
    add_column :recipes, :cost, :decimal
  end
end
