class UsersController < ApplicationController
  include Pundit

  def index
    #binding.pry
    @users = User.paginate(page: params[:page]).where(active: 1)
    #authorize @users
  end

  def show
    @user = User.find(params[:id])
    #authorize @user
  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)

    if @user.save
      flash[:error] = "User is not created."
      redirect_to @user, notice: "User created successfully!"
    else
      flash[:error] = "User could not be saved."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update_attributes(user_edit_params)

    if @user.save  
      redirect_to @user, notice: "Successfully updated user!"
    else
      flash[:error] = "User not updated. Please try again."
      render :edit
    end
  end

  def deactivate
    @user = User.find(params[:user_id])
    authorize @user
    @user.update_attributes(:active => 0)

    if @user.save  
      flash[:notice] = "Sub Indication succefully deleted."
      redirect_to action: "index" 
    else
      flash[:error] = "User not deleted. Please try again."
    end

  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :role_ids)
  end

  def user_edit_params
    params.require(:user).permit(:email, :name, :role_ids)
  end
end
