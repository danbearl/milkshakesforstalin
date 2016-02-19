class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :quantity
      t.string :name
      t.string :preparation
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
