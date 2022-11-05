class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new
    @user = current_user
    @product = Product.find(params[:product_id])
    @order.product = @product
    @order.user = @user
    if @order.save
      redirect_to product_path(@product), notice: "Order purchased successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
