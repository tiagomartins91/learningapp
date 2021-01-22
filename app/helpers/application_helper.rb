module ApplicationHelper
  include Pagy::Frontend

  def crud_label(key)
    case key
      when 'create'
        "<i class='fa fa-plus'></i>".html_safe
      when 'update'
        "<i class='fa fa-pen'></i>".html_safe
      when 'destroy'
        "<i class='fa fa-trash'></i>".html_safe
    end
  end

  def modal_label(modal)
    case modal
      when 'Course'
        "<i class='fa fa-graduation-cap'></i>".html_safe
      when 'Lesson'
        "<i class='fa fa-tasks'></i>".html_safe
      when 'Enrollment'
        "<i class='fa fa-lock-open'></i>".html_safe
      when 'Comment'
        "<i class='fa fa-comment'></i>".html_safe
    end
  end
end
