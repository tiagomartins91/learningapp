module CoursesHelper

  def enrollment_button(course)

    #link to check price
    unless current_user
      return link_to "Check price", course_path(course), class: "btn btn-md btn-success"
    end

    if course.user == current_user
      return link_to "You created this course. View analytics!", course_path(course)
    end

    if user_has_enroll_this_course(course, current_user)
      return link_to "You bought this course. Keep learning!", course_path(course)
    end

    link_to  course.price > 0 ? number_to_currency(course.price): "Free", new_course_enrollment_path(course), class: "btn btn-md btn-success"
  end


  private

  def user_has_enroll_this_course(course, current_user)
    course.enrollments.where(user: current_user).any?
  end

end
