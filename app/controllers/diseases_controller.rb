class DiseasesController < ApplicationController
  respond_to :html, :js
  before_action :all_susbindicatios, only: [:add_subindicaqtion]

  def index
    @diseases = Disease.paginate(page: params[:page])
    @indications = Indication.all
    #@subindications = Subindication.joins(:indications).where("indication_id = ?", Indication.first.id)
  end

  def show
    @disease = Disease.find(params[:id])
    @category = @disease.categories.first
    @subindications = Subindication.by_disease(params[:id])
    #    @disease = Disease.find(params[:id])
    #    @category = @disease.categories.first
    #    @subindications = @disease.subindications
  end

  def new
    @disease = Disease.new
    @indications = Indication.all
    @subindications = Subindication.joins(:indications).where("indication_id = ?", Indication.first.id)
    #@subindications = Indication.get_subindications_by_id(Indication.first.id)
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
    @disease_id = params[:id]
    @subindications = @disease.subindications
    @list_indications = Indication.all
    @list_subindications = Subindication.by_indication(Indication.first.id)
  end

  def update_subindications 
    @subindications = Subindication.by_indication(params[:indication_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def get_subindications
    @subindications = {
      :subindications => Subindication.by_disease(params[:disease_id]),
      :form => {
        :action => edit_disease_path(params[:disease_id]),
        :csrf_param => request_forgery_protection_token,
        :csrf_token => form_authenticity_token
      }
    }
  end

  def add_subindication 
    @disease_sub = DiseaseSubindication.new(disease_id: params[:disease_id], subindication_id: params[:subindication_id])
    if @disease_sub.save
      @subindications = Subindication.by_disease(params[:disease_id])
      respond_to do |format|
        format.html
        format.js 
      end
    end
  end

  def remove_subindication 
    @rm = DiseaseSubindication.where("disease_id = ? and subindication_id=?", params[:disease_id], params[:subindication_id])
    if @rm.destroy_all
      @subindications = Subindication.by_disease(params[:disease_id])
      respond_to do |format|
        format.html
        format.js 
      end
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
    params.require(:disease).permit(:indication_id, :subindications[])
  end

  def all_subindications
    @subindications = Subindication.by_disease(params[:disease_id])
  end
end
