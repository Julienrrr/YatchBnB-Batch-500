class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def create?
    record.booking.user == user && record.booking.review.nil?
  end
end
