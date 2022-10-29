class YarnsController < ApplicationController
  def index
    @yarns = Yarn.all
  end

  def show
    @yarn = Yarn.find(params[:id])
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
    @yarn = Yarn.find(params[:id])
  end

  def update
    @yarn = Yarn.find(params[:id])
    @yarn = Yarn.update(yarn_params)
    redirect_to yarn_path(@yarn), notice: "Yarn updated successfully."
  end

  def destroy
    @yarn = Yarn.find(params[:id])
    @yarn.destroy
    redirect_to yarns_path, status: :see_other
  end

  private

  def yarn_params
    params.require(:yarn).permit(:name, :brand, :material, :price)
  end
end
