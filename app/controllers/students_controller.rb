class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Welcome to OneSource!"
      redirect_to @student
    else
      render 'new'
    end
  end



  private

    def student_params
      params.require(:student).permit(:name, :email, :password,
                                    :password_confirmation,
                                    :phone_number,
                                    :education_level,
                                    :dob)
    end
end
