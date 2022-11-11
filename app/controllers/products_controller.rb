require 'time'
class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    if params[:query].present?
      @products = Product.search_by_name_brand_material(params[:query])
    else
      @products = Product.all
    end

    @markers = @products.geocoded.map do |product|
      { lat: product.latitude, lng: product.longitude }
    end
  end

  def show
    @suggested_products = Product.all.sample(4)
    @marker = { lat: @product.geocode[0], lng: @product.geocode[1] }
    @time_ago = ((Time.new - @product.created_at) / 1.day).round
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: "Product added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :brand, :material, :price, :quantity, :color, :weight, :size, :address,
                                    :description, photos: [])
  end
end
