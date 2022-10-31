class OrdersController < ApplicationController
    def new
    @order = Order.new
  end

  def create
    @order.user = User.find(params[user_id])
    @order = Order.create(order_params)
    if @order.save
      redirect_to order_path(@order), notice: "Order placed successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :yarn_id)
  end
end
