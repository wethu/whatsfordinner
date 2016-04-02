class AddRecipes < ActiveRecord::Migration
  def change
    create_table :recipes, force: true do |t|
      t.string :name
      t.string :ingredients
      t.string :prep
      t.string :method
      t.timestamps
    end
  end
end
