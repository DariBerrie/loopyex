class UsersController < ApplicationController

  def show
    # Show another user
    @user = User.find(params[:id])
    @orders = Order.where(user: @user)
    @products = @user.products
  end

end
