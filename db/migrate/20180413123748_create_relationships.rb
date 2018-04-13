class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :souschef_id
      t.integer :connoisseur_id

      t.timestamps null: false
    end
    add_index :relationships, :souschef_id
    add_index :relationships, :connoisseur_id
    add_index :relationships, [:souschef_id, :connoisseur_id], unique: true
  end
end
