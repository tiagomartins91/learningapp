class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @user.has_role?(:admin) || @record.course.user.id == @user.id if @user
  end

  def edit?
    @record.course.user.id == @user.id if @user
  end

  def update?
    @record.course.user.id == @user.id if @user
  end

  def new?
    #@user.has_role?(:teacher)
  end

  def create?
    #@user.has_role?(:teacher)
  end

  def destroy?
    @record.course.user.id == @user.id if @user
  end
end
