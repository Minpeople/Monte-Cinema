class ReservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user_id == user.id || user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    record.user_id == user.id || user.admin?
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
