class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @record.user == @user if @user
  end

  def update?
    @record.user == @user if @user
  end

  def new?
    @user.has_role?(:teacher)
  end

  def create?
    @user.has_role?(:teacher)
  end

  def destroy?
    @user.has_role?(:admin) || @record.user.id == @user.id if @user
  end

  def owner?
    @record.user == @user if @user
  end

  def approve?
    @user.has_role?(:admin) if @user
  end
end
