class AddDinnerIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :dinner_id, :integer
  end
end
