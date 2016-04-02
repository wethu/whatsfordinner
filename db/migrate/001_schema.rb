class Schema < ActiveRecord::Migration
  def change
    create_table :dinners, force: true do |t|
      t.string :name
      t.string :protein
      t.string :ingredients
      t.integer :prep_time
      t.timestamps
    end
  end
end
