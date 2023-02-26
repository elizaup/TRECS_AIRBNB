class UsersController < ApplicationController

  def show
    @user = current_user
    @rentals = Item.where(user: @user).map(&:rentals).flatten

    @pending = @rentals.select { |rental| rental.confirmed == false }
    @confirmed = @rentals.select { |rental| rental.confirmed }

    authorize @user
  end



end
