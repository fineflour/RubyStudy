class UserPolicy < ApplicationPolicy
  def index?
    user.admin? 
  end

  def show?
    user.admin? 
  end

  def edit?
    user.admin? 
  end

  def update?
    user.admin? 
  end

  def deactivate?
    user.admin? 
  end

end
