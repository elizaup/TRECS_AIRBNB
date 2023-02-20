class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.all
  end

  def show
    # @task = Task.find(params[:id]) -> refactored and added to set_item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item)
  end

  def destroy
    # @task = Task.find(params[:id]) -> refactored and added to set_item
    @item.destroy
    redirect_to items_path # status: :see_other
  end

  def edit
    # @item = Item.find(params[:id]) -> refactored and added to set_item
  end

  def update
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
