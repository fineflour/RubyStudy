class MyomregistrationsController < Devise::RegistrationsController

  def new
    current_user = ''
    redirect_to new_user_registration_path
  end

  def create
    redirect_to user_path
  end
end
