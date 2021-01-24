class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :privacy_policy]
  def index
    @latest = Course.all.latest_courses.published.approved
    @latest_good_reviews = Enrollment.reviewed.latest_good_reviews

    @top_rated = Course.top_rated_courses.published.approved
    @popular = Course.popular_courses.published.approved
    @purchased_courses = Course.joins(:enrollments).where(enrollments: {user: current_user}).order(created_at: :desc).limit(3)
  end

  def activity
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end

    @pagy, @activities = pagy(PublicActivity::Activity.all.order(created_at: :desc))
  end

  def analytics
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end

    #charts data
    #@users = User.all
    #@enrollments = Enrollment.all
    #@courses = Course.all
  end

  def privacy_policy
  end

end
