class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_path(@student)
  end

  def show
    set_student
  end
  
  def edit
    set_student
  end

  def update
    set_student
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  private 
    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end

    def set_student
      @student = Student.find_by_id(params[:id])
    end
end
