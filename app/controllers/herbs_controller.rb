class HerbsController < ApplicationController
  def index
    @herbs = Herb.order(:name_eng).paginate(page: params[:page])
  end
  def show
    @herb = Herb.find(params[:id])
  end

  def new
    @herb = Herb.new
  end

  def create
    @herb = Herb.new(herb_params)
    if @herb.save
      flash[:error] = "Indication created."
      redirect_to @herb, notice: "Product created successfully!"
    else
      flash[:error] = "Indication could not be saved."
      render :new

    end
  end

  def edit
    @herb = Herb.find(params[:id])
  end

  def update
    @herb = Herb.find(params[:id])
    @herb.update_attributes(herb_params)

    if @herb.save  
      redirect_to @herb, notice: "Successfully updated inducation!"
    else
      flash[:error] = "Indication not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @herb = Herb.find(params[:id]).destroy

    flash[:notice] = "Indication succefully deleted."
    redirect_to @herb
  end

  def herb_params
    params.require(:herb).permit(:category_id, :name_eng, :name_ko, :contraindication,  :qty, :actions, :notes, :property=>[], :nature=>[], :channel =>[],:indication_ids => [])
  end
end
