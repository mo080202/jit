module SessionsHelper
  def current_course
    @current_course ||= Course.find_by(id: session[:course_id])
  end
  def current_course?(course)
    course == current_course
  end
end
