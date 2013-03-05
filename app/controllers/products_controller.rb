class ProductsController < ApplicationController

  def new
  	@product = current_user.products.build
  end

  def edit
  end

  def create
  	@user = current_user
  	@product = current_user.products.build(params[:product])
    if @product.save
      flash[:success] = "product created!"
      redirect_to @user
    else
      render 'products/new'
    end
  end

  def show
  end

  def destroy
  end
end