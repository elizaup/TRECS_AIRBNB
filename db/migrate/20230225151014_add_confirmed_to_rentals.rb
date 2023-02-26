class AddConfirmedToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :confirmed, :boolean, default: false
  end
end
