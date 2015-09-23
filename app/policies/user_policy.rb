class UserPolicy < ApplicationPolicy
  def index?
    user.admin? 
  end

  def show?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end


end
