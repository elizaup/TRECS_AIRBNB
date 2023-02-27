class RentalsController < ApplicationController
  before_action :find_rental, only: [ :approve, :destroy]

  def index
    @user = current_user
    @rentals = Rental.where(user: @user)
    @rentals = policy_scope(Rental)

    @pending = @rentals.select { |rental| rental.confirmed == false }
    @confirmed = @rentals.select { |rental| rental.confirmed }
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
      redirect_to rentals_path, notice: 'Rental request successful'
    else
      redirect_to new_item_rental_path(@item), status: :unprocessable_entity
    end
  end

  def approve
    @rental.confirmed = true
    authorize @rental
    if @rental.save
      redirect_to user_path(@rental.user_id), notice: 'Rental approved'
    else
      redirect_to user_path(@rental.user_id), status: :unprocessable_entity
    end
  end

  def destroy
    authorize @rental
    @rental.destroy
    redirect_to rentals_path, status: :see_other
  end

  private

  def find_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :user_id, :item_id)
  end
end
