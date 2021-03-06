class UsersController < ApplicationController
include Pundit
#include CanCan
  def index
    #binding.pry
    @users = User.paginate(page: params[:page])
    #authorize @users
  end

  def show
    @user = User.find(params[:id])
    @role = @user.roles.first
    #authorize @user
  end

  def edit
    @user = User.find(params[:id])
    @role = @user.roles.first
    #authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update_attributes(user_params)
    @role = UserRole.find_by_user_id(params[:id])
    @role.update_column(:role_id, params[:user][:roles])

    if @user.save  
      redirect_to @user, notice: "Successfully updated user!"
    else
      flash[:error] = "User not updated. Please try again."
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
