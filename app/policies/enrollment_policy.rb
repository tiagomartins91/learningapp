class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.has_role?(:admin)
  end

  def edit?
    @record.user == @user if @user
  end

  def update?
    @record.user == @user if @user
  end

  def destroy?
    @user.has_role?(:admin)
  end
end
