class StudentsController < ApplicationController
  before_action :authenticate_user!
  expose(:students) { Student.all }
  expose(:student, attributes: [:student_params, :id])
  expose(:student_subject_items) { student.subject_items }
  expose(:subject_items) { SubjectItem.all }


  def create
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.created', resource: 'Student')
    else
      render :new
    end
  end

  def update
    if student.save
      flash[:success] = "Hey, #{student.first_name}"
      redirect_to student_path(student), notice: I18n.t('shared.updated', resource: 'Student')
    else
      flash[:error] = "can't be blank"
      render :edit
    end
  end

  def destroy
    student.destroy
    redirect_to students_path, notice: I18n.t('shared.deleted', resource: 'Student')
  end

  private
  
  def student_params
    params.require(:student).permit(:first_name, :last_name, :id, subject_ids: [])
  end
end
