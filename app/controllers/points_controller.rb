class PointsController < ApplicationController
  def index
    @points = Point.order(:id)
  end

  def show
    @point = Point.find(params[:id])
  end

  def edit
    @point = Point.find(params[:id])
  end
  def new
    @point = Point.new
  end

  def create
    @point = Point.new(point_params)

    if @point.save
      flash[:error] = "Point is not created."
      redirect_to @point, notice: "Point created successfully!"
    else
      flash[:error] = "Point could not be saved."
      render :new
    end
  end

  def update
    @point = Point.find(params[:id])
    @point.update_attributes(point_params)

    if @point.save  
      redirect_to @point, notice: "Successfully updated point!"
    else
      flash[:error] = "Point not updated. Please try again."
      render :edit
    end
  end
  def destroy
    @point = Point.find(params[:id]).destroy
    flash[:notice] = "Point succefully deleted."
    redirect_to @point
  end

  private
  def point_params
    params.require(:point).permit(:name_eng, :name_ko, :location, :indication_ids => [])
  end
end
