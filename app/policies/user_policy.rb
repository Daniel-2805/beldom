class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def admin?
    true
  end

  def owner?
    true
  end

  def buyer?
    true
  end

end
