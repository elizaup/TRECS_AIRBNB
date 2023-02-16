class AddItemReferenceToRentals < ActiveRecord::Migration[7.0]
  def change
    add_reference :rentals, :item
  end
end
