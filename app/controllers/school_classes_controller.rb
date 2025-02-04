class SchoolClassesController < ApplicationController
  def index
    @school_classes = SchoolClass.all
  end
  
  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.create(school_class_params)
    redirect_to school_class_path(@school_class)
  end

  def show
    set_school_class
  end
  
  def edit
    set_school_class
  end

  def update
    set_school_class
    @school_class.update(school_class_params)
    redirect_to school_class_path(@school_class)
  end

  private 
    def school_class_params
      params[:school_class][:room_number] = params[:school_class][:room_number].to_i
      params.require(:school_class).permit(:title, :room_number)
    end
  
    def set_school_class
      @school_class = SchoolClass.find_by_id(params[:id])
    end
end
