class TicketDeskPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def create?
      authorization?
    end

    def resolve?
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end

    def update?
      user.client? || user.admin?
    end

    def destroy?
      user.client? || user.admin?
    end

    private
    def authorization?
       user.admin?
    end
  end
end
