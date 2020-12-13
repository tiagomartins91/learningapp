module CoursesHelper

  def enrollment_button(course)

    #link to check price
    unless current_user
      return link_to "Check price", course_path(course), class: "btn btn-md btn-success"
    end

    if course.user == current_user
      return link_to "You created this course. View analytics!", course_path(course)
    end

    if is_user_enroll_this_course(course, current_user)
      return link_to "You bought this course. Keep learning!", course_path(course)
    end

    link_to  course.price > 0 ? number_to_currency(course.price): "Free", new_course_enrollment_path(course), class: "btn btn-md btn-success"
  end

  def review_button(course)
    return unless current_user

    if is_enrollment_not_reviewed(course, current_user)
      return link_to 'Add a review', edit_enrollment_path(user_course_enrollments(course, current_user))
    end

    unless course.user == current_user || !is_user_enroll_this_course(course, current_user)
      link_to 'Thanks for reviewing! Your review.', enrollment_path(user_course_enrollments(course, current_user))
    end

  end

  private

  def is_user_enroll_this_course(course, current_user)
    course.enrollments.where(user: current_user).any?
  end

  def is_enrollment_not_reviewed(course, current_user)
    course.enrollments.where(user: current_user).pending_review.any?
  end

  def user_course_enrollments(course, current_user)
    course.enrollments.where(user: current_user).first
  end

end
