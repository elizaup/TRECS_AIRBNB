class RenameClothesToItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :clothes, :items
  end
end
