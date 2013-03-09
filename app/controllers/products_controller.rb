class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:show, :new, :edit, :update]
  before_filter :correct_user,   only: [:show, :new, :edit, :update]

  def new
  	@product = current_user.products.build
  end

  def edit
  end

  def create
  	@user = current_user
  	@product = current_user.products.build(params[:product])
    @product.user_id = current_user.id
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

private

    def signed_in_user
      if not signed_in?
        redirect_to(root_path) 
        flash[:notice] =  "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end