class CategoriesController < ApplicationController

  def index
    @categories = Category.order('category_type')
  end

  def create 
    binding.pry
    @category = Category.new(category_params)
    #binding.pry
    if @category.save          
      render json: @category 
    else                   
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    head :no_content
  end


  private
  def category_params
    params.require(:category).permit(:name_eng, :name_ko, :category_type)
  end
end
