class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredients
      t.text :method
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :recipes, [:user_id, :created_at]
  end
end
