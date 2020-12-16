class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @latest = Course.all.latest_courses
    @latest_good_reviews = Enrollment.reviewed.latest_good_reviews

    @top_rated = Course.top_rated_courses
    @popular = Course.popular_courses
    @purchased_courses = Course.joins(:enrollments).where(enrollments: {user: current_user}).order(created_at: :desc).limit(3)
  end

  def activity
    @activities = PublicActivity::Activity.all.order(updated_at: :desc)
  end


end
