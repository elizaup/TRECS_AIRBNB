class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def destroy?
    # only the person that created the listing
    return record.user == user
  end

  def approve?
    return true
    # record.item.user == current_user
  end

  # def edit?
  #   return update?
  # end

  # def update?
  #   # only the person that created the listing
  #   return record.user == user
  # end
end
