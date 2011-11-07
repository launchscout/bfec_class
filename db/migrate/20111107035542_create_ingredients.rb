class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :description
      t.belongs_to :recipe

      t.timestamps
    end
    add_index :ingredients, :recipe_id
  end
end
