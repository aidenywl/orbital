class StudentSessionsController < ApplicationController
  def new
  end
  
  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      # Log the student in and redirect to the sudent's show page.
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    
  end
  
end
