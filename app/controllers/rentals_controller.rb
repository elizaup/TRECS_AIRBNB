class RentalsController < ApplicationController
  before_action :find_rental, only: [:request, :show, :approve]
  # before_action :find_item, only: [ :confirmation, :request ]

  def show
  end

  def new
    @rental = Rental.new
    @item = Item.find(params[:item_id])
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.item = Item.find(params[:item_id])
    authorize @rental
    if @rental.save!
      redirect_to item_rentals_path(@rental.item), notice: 'Rental request successful'
    else
      redirect_to new_item_rental_path(@item), status: :unprocessable_entity
    end
  end

  # def confirmation
  #   if @rental.update(confirmed)
  #     redirect_to rental_path(@rental), notice: 'Rental confirmed'
  #   else
  #     render 'confirmation', status: :unprocessable_entity
  #   end
  # end

  def approve
    @rental.confirmed = true
    authorize @rental
    if @rental.save
      redirect_to user_path(@rental.user_id), notice: 'Rental approved'
    else
      redirect_to user_path(@rental.user_id), status: :unprocessable_entity
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def find_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :user_id, :item_id)
  end
end
