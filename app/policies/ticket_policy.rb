class ReservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user == user|| user.admin?
  end

  def update?
    record.user == user || user.admin?
  end

  def destroy?
    record.user == user || user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.all if user.admin?

      scope.where(user_id: user.id)
    end
  end
end
