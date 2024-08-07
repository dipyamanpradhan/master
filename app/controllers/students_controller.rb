class StudentsController < ApplicationController
  before_action :require_login
  def create
    @student = Student.new(student_params)
    @student.teacher_id = session[:user_id]
    if @student.save
      redirect_to home_path
      flash[:notice] = "Student added successfully."
    else
      flash[:alert] = "Error adding student."
      render :new
    end
  end
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to home_path
      flash[:notice] = "Student Updated successfully."
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def delete_student
    @student = Student.find(params[:id])
    @student.is_deleted = true
    @student.save
    redirect_to home_path, notice: 'Student was successfully deleted.'
  end

  private

    def student_params
      params.require(:student).permit(:name, :subject, :marks)
    end
end
