module StudentSessionsHelper
    
  # Logs in the given student.
  def log_in(student)
    session[:student_id] = student.id
  end
  
  # Returns the current logged-in student (if any).
  def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end
  
  # Returns true if the student is logged in, false otherwise.
  def logged_in?
    !current_student.nil?
  end
  
end
