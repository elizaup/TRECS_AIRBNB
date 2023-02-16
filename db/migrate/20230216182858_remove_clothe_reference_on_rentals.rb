class RemoveClotheReferenceOnRentals < ActiveRecord::Migration[7.0]
  def change
    remove_reference :rentals, :clothe
  end
end
