class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    record.booking.user == user
  end

  def create?
    record.booking.user == user
  end
end
