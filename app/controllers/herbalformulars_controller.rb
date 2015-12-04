class HerbalformularsController < ApplicationController
  def index
    @herbalformulars = Herbalformular.order(:name_eng).paginate(page: params[:page])
  end
  def show
    @herbalformular = Herbalformular.find(params[:id])
  end

  def new
    @herbalformular = Herbalformular.new
  end

  def create
    @herbalformular = Herbalformular.new(herb_params)
    if @herbalformular.save
      flash[:error] = "Indication created."
      redirect_to @herbalformular, notice: "Product created successfully!"
    else
      flash[:error] = "Indication could not be saved."
      render :new

    end
  end

  def edit
    @herbalformular = Herbalformular.find(params[:id])
  end

  def update
    @herbalformular = Herbalformular.find(params[:id])
    @herbalformular.update_attributes(herb_params)

    if @herbalformular.save  
      redirect_to @herbalformular, notice: "Successfully updated inducation!"
    else
      flash[:error] = "Indication not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @herbalformular = Herbalformular.find(params[:id]).destroy

    flash[:notice] = "Indication succefully deleted."
    redirect_to @herb
  end

  def herbalformular_params
    params.require(:herb).permit(:name_eng, :name_ko, :preperty, :nature, :contraindication, :channel, :indication_ids => [])
  end
end
