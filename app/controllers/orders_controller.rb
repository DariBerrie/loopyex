class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
  end

  def create
  end
end
