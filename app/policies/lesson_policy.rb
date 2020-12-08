class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    if @user
      @user.has_role?(:admin) || @record.course.user_id == @user.id || @record.course.bought(@user) == true
    end

  end

  def edit?
    @record.course.user_id == @user.id if @user
  end

  def update?
    @record.course.user_id == @user.id if @user
  end

  def new?
    #@user.has_role?(:teacher)
  end

  def create?
    @record.course.user_id == @user.id if @user
  end

  def destroy?
    @record.course.user_id == @user.id if @user
  end
end
