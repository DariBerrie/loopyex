class YarnsController < ApplicationController
# YarnsController may be able to inherit ProductsController
  before_action :set_yarn, only: %i[ show edit destroy update ]

  def index
    @yarns = Yarn.all
  end

  def show
  end

  def new
    @yarn = Yarn.new
  end

  def create
    @yarn.user = User.find(params[user_id])
    @yarn = Yarn.create(yarn_params)
    if @yarn.save
      redirect_to yarn_path(@yarn), notice: "Yarn added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @yarn = Yarn.update(yarn_params)
    redirect_to yarn_path(@yarn), notice: "Yarn updated successfully."
  end

  def destroy
    @yarn.destroy
    redirect_to yarns_path, status: :see_other
  end

  private

  def set_yarn
    @yarn = Yarn.find(params[:id])
  end

  def yarn_params
    params.require(:yarn).permit(:name, :brand, :material, :price)
  end
end
