class Admin::CategoriesController < ApplicationController

  admin_username = ENV["ADMIN_USERNAME"]
  admin_password = ENV["ADMIN_PASSWORD"]

  http_basic_authenticate_with name: admin_username, password: admin_password  

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:category).permit(
      :name
    )
  end

end
