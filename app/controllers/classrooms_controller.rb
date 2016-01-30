class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def create
  	@classroom = Classroom.new(classroom_params)

  	respond_to do |format|
  		if @classroom.save
        format.html { redirect_to @classroom, notice: I18n.t(:created, model: I18n.t(:classroom, scope: "activerecord.models")) }
      else
        format.html { render :new }
      end
  	end
  end

  def destroy
  	@classroom = Classroom.find(params[:id])
  	@classroom.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: I18n.t(:deleted, model: I18n.t(:student, scope: "activerecord.models")) }
    end
  end

  private
  	def classroom_params
      params.require(:classroom).permit(:student_id, :course_id)
    end
end