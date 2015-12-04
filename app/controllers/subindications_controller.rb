class SubindicationsController < ApplicationController
  def index
    @subindications = Subindication.order(:name_eng).paginate(page: params[:page])
  end

  def show
    @subindication = Subindication.find(params[:id])
    @zangfus = @subindication.zangfus
  end

  def new
    @subindication = Subindication.new
  end

  def create    
    @subindication = Subindication.new(subindication_params)
    #binding.pry
    if @subindication.save  
      flash[:error] = "Indication created."
      redirect_to @subindication, notice: "Sub Indication created successfully!"
    else
      flash[:error] = "Sub Indication could not be saved."
      render :new
    end
  end

  def edit
    @subindication = Subindication.find(params[:id])
  end

  def update
    @subindication = Subindication.find(params[:id])
    @subindication.update_attributes(subindication_params)

    if @subindication.save  
      redirect_to @subindication, notice: "Successfully updated Sub Inducation!"
    else
      flash[:error] = "Sub Indication not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @subindication = Subindication.find(params[:id]).destroy

    flash[:notice] = "Sub Indication succefully deleted."
    redirect_to @subindication
  end

  def subindication_params
    params.require(:subindication).permit(:name_eng, :name_ko, :description, :zangfu_ids => [], :indication_ids => [])
  end
end
