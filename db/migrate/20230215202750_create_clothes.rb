class CreateClothes < ActiveRecord::Migration[7.0]
  def change
    create_table :clothes do |t|
      t.string :name
      t.float :price
      t.string :condition
      t.string :category
      t.string :brand
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
