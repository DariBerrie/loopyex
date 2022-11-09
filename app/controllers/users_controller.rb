class UsersController < ApplicationController

  def show
    # Show another user
    @user = User.find(params[:id])
    @user_orders = Order.where(user: @user)
    @user_products = @user.products
  end

end
