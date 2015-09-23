class ZangfusController < ApplicationController
  def index
    @zangfus = Zangfu.paginate(page: params[:page])
  end

  def show
    @zangfu = Zangfu.find(params[:id])
  end

  def edit
    @zangfu = Zangfu.find(params[:id])
  end

  def new
    @zangfu = Zangfu.new
  end

  def create
    @zangfu = Zangfu.new(zangfu_params)

    if @zangfu.save
      flash[:error] = "Zangfu is not created."
      redirect_to @zangfu, notice: "Zangfu created successfully!"
    else
      flash[:error] = "Zangfu could not be saved."
      render :new
    end
  end

  def update
    @zangfu = Zangfu.find(params[:id])
    @zangfu.update_attributes(zangfu_params)

    if @zangfu.save  
      redirect_to @zangfu, notice: "Successfully updated Zangfu!"
    else
      flash[:error] = "Zangfu not updated. Please try again."
      render :edit
    end
  end



  def destroy
    @zangfu = Zangfu.find(params[:id]).destroy

    flash[:notice] = "Indication succefully deleted."
    redirect_to @zangfu

  end

  private
  def zangfu_params
    params.require(:zangfu).permit(:name_eng, :name_ko,:meridian_eng, :meridian_ko,:description)
  end
end
