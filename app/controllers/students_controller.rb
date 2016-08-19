class StudentsController < ApplicationController

	def index
    @students = Student.all
  end

  def show
  	@student = Student.find(set_student)
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  def edit
  	@student = Student.find(set_student)
  end

  def create
    student = Student.create(student_params)
		redirect_to student_path(student)    
  end

  def update
		student = Student.find(set_student)  	
    student.update(student_params)
		redirect_to student_path(student) 
  end

  # DELETE /students/1
  # DELETE /students/1.json
  # def destroy
  #   @school_class.destroy
  #   respond_to do |format|
  #     format.html { redirect_to students_url, notice: 'School class was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end
end
