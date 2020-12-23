class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @record.published? && @record.approved? ||
      @user.present? && (@user.has_role?(:admin) || @record.user == @user || @record.bought(@user))
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
    #@user.has_role?(:admin) || @record.user == @user if @user
    @record.enrollments.none? && @record.user == @user if @user
  end

  def owner?
    @record.user == @user if @user
  end

  def approve?
    @user.has_role?(:admin) if @user
  end

  def admin_or_owner?
    @user.has_role?(:admin) || @record.user == @user if @user
  end
end
