class PointIndicationsController < ApplicationController
  def index
    @point_indications = PointIndication.paginate(page: params[:page])
  end

  def show
    @point_indication = PointIndication.find(params[:id])
  end

  def edit
    @point_indication = PointIndication.find(params[:id])
  end

  def update
    @point_indication = User.find(params[:id])
    @point_indication.update_attributes(pi_params)

    if @point_indication.save  
      redirect_to @point_indication, notice: "Successfully updated point indication!"
    else
      flash[:error] = "Point_ ndication not updated. Please try again."
      render :edit
    end
  end

  private
  def pi_params
    params.require(:point_indication).permit(:point_id, :indication_id)
  end
end
