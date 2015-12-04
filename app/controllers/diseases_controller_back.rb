#class DiseasesController < ApplicationController
  def index
    @diseases = Disease.paginate(page: params[:page])
  end

  def show
    @disease = Disease.find(params[:id])
    @category = @disease.categories.first
    @subindications = @disease.subindications
  end

  def new
    @disease = Disease.new
    @indications = Indication.all
    @subindications = Indication.get_subindications_by_id(params[:indication_id])
  end

  def create
    @disease = Disease.new(disease_params)
    if @disease.save
      flash[:error] = "Disease is not created."
      redirect_to @disease, notice: "Disease created successfully!"
    else
      flash[:error] = "Disease could not be saved."
      render :new
    end
  end


  def edit
    @disease = Disease.find(params[:id])
    @indications = Indication.all
    @subindications = @disease.subindications
  end

  def update_subindications 
    @subindications = Indication.get_subindications_by_id(params[:indication_id])
    binding.pry
    respond_to do |format|
      format.js
    end
  end

  def add_subindication 
    @disease = Disease.new(subindication_params)
    if @disease.save
      flash[:error] = "Disease is not created."
      redirect_to @disease, notice: "Disease created successfully!"
    else
      flash[:error] = "Disease could not be saved."
      render :new
    end
  end


  def update
    @disease = Disease.find(params[:id])
    @disease.update_attributes(disease_params)
    if @disease.save  
      redirect_to @disease, notice: "Successfully updated Disease!"
    else
      flash[:error] = "Disease not updated. Please try again."
      render :edit
    end
  end


  def destroy
    @disease = Disease.find(params[:id]).destroy

    flash[:notice] = "Disease succefully deleted."
    redirect_to @disease
  end

  private
  def disease_params
    params.require(:disease).permit(:name_eng, :name_ko, :name_tcm, :description, :category[],:organs[])
  end

  def subindication_params
    params.require(:disease).permit(:subindications[])
  end

end
