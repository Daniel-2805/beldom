class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end
  def show?
    true
  end
  def update?
    user.permission_level == "admin"
  end
  def destroy?
    user.permission_level == "admin"
  end
end
