class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.all
    @items = policy_scope(Item)
  end

  def show
    # @task = Task.find(params[:id]) -> refactored and added to set_item
    @rental = Rental.new
    authorize @item
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)

    @item.user = current_user
    authorize @item

    @item.save
    redirect_to item_path(@item)
  end

  def destroy
    # @task = Task.find(params[:id]) -> refactored and added to set_item
    authorize @item
    @item.destroy
    redirect_to root_path # status: :see_other
  end

  def edit
    # @item = Item.find(params[:id]) -> refactored and added to set_item
    # authorize @item
  end

  def update
    # authorize @item
    # @item = Item.find(params[:id]) -> refactored and added to set_item
    # raise
    @item.update(item_params)
    redirect_to item_path(@item)
    # else
    # render "edit" #will go back / stay on the same page
  end

  private

  def item_parms
    params.require(:item).permit(:name, :price, :condition, :category, :brand, :available, photos: [])

  end

  def set_item
    @item = Item.find(params[:id])
  end
end
