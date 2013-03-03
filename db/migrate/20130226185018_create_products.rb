class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :name
      t.integer :category_id
      t.string :description
      t.float :price
      t.text :file
      t.integer :quantity_to_sell
      t.boolean :active
      t.boolean :visible

      t.timestamps
    end
    add_index :products, [:user_id, :created_at]
  end
end
