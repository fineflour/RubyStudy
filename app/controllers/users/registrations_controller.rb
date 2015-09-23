class Users::RegistationsController < Devise::RegistrationController
  include Pundit
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :requre_no_authentication

  def check_permissions
    authorize! :create, resource
  end
end
