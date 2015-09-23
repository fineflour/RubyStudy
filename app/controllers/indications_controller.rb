class IndicationsController < ApplicationController
  def index
    @indications = Indication.order(:name_eng).paginate(page: params[:page])
  end
  def show
    @indication = Indication.find(params[:id])
  end


  def new
    @indication = Indication.new
  end

  def create
    @indication = Indication.new(indication_params)
    #binding.pry
    if @indication.save
      flash[:error] = "Indication created."
      redirect_to @indication, notice: "Product created successfully!"
    else
      flash[:error] = "Indication could not be saved."
      render :new

    end
  end

  def edit
    @indication = Indication.find(params[:id])
  end

  def update
    @indication = Indication.find(params[:id])
    @indication.update_attributes(indication_params)

    if @indication.save  
      redirect_to @indication, notice: "Successfully updated inducation!"
    else
      flash[:error] = "Indication not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @indication = Indication.find(params[:id]).destroy

    flash[:notice] = "Indication succefully deleted."
    redirect_to @indication
  end

  def indication_params
    params.require(:indication).permit(:name_eng, :name_ko, :description)
  end
end
