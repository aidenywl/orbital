module StudentSessionsHelper
    
  # Logs in the given student.
  def log_in(student)
    session[:student_id] = student.id
  end
  
  # Logs out the current student.
  def log_out
    forget(current_student)
    session.delete(:student_id)
    @current_student = nil
  end
  
  # Returns the current logged-in student (if any).
  def current_student
    if (student_id = session[:student_id])
      @current_student ||= Student.find_by(id: student_id)
    elsif (student_id = cookies.signed[:student_id])
      student = Student.find_by(id: student_id)
      if student && student.authenticated?(cookies[:remember_token])
        log_in student
        @current_student = student
      end
    end
  end
  
  # Returns true if the student is logged in, false otherwise.
  def logged_in?
    !current_student.nil?
  end
  
  # Remembers a student in a persistent session.
  def remember(student)
    student.remember
    cookies.permanent.signed[:student_id] = student.id
    cookies.permanent[:remember_token] = student.remember_token
  end
  
  # Forgets a persistent session.
  def forget(student)
    student.forget
    cookies.delete(:student_id)
    cookies.delete(:remember_token)
  end
  
end
