class RentalsController < ApplicationController
  before_action :find_rental, only: [ :confirmation, :request, :show ]
  before_action :find_item, only: [ :confirmation, :request ]

  def new
    @rental = Rental.new
    @item = Item.find(params[:item_id])
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.item = Item.find(params[:item_id])
    @rental.user = current_user
    if @rental.save!
      redirect_to rental_path(@rental), notice: 'Rental request successful'
      # need a rental confirmation page?
    else
      render 'request', status: :unprocessable_entity
    end
  end

  def confirmation
    if @rental.update(confirmed)
      redirect_to rental_path(@rental), notice: 'Rental confirmed'
    else
     render 'confirmation', status: :unprocessable_entity
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
