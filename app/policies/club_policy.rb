class ClubPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    user.admin
  end

  def create?
    user.admin
  end

  def show?
    true
  end
end
