class RentalsController < ApplicationController
  # before_action :authenticate_user!

  def show
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.item = Item.find(params[:item_id])
  end


  def rental_request
  end

  def confirmation
    if
  end


  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :confirmed, :user_id, :item_id)
  end
end
