class ChefsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      redirect_to root_path, notice: "You are now a chef!"
    else
      render :new
    end
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def updated
    @chef = Chef.find(params[:id])

    if @chef.update_attributes(chef_params)
      redirect_to root_path, notice: 'Update Successfull!'
    else
      render :edit
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :email, :password, :password_confirmation, :experience, :location,
                                products_attributes: [:name, :description, :url, :_destroy])
  end

end
