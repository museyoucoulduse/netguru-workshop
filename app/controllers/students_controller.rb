class StudentsController < ApplicationController
  before_action :authenticate_user!
  expose(:students) { Student.all }
  expose(:student, attributes: [:student_params, :id])
  expose(:student_subject_items) { student.subject_items }
  expose(:subject_items) { SubjectItem.all }
  expose(:subject_item)


  def create
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.created', resource: 'Student')
    else
      render :new
    end
  end

  def update
    if student.update(student_params)
      # flash[:success] = "Hey, #{student.first_name}"
      redirect_to student_path(student), notice: I18n.t('shared.updated', resource: 'Student'), success: "Hey, #{student.first_name}"
    else
      render :edit, error: "can't be blank"
    end
  end

  def destroy
    student.destroy
    redirect_to students_path, notice: I18n.t('shared.deleted', resource: 'Student')
  end

  private
  
  def student_params
    params.require(:student).permit(:first_name, :last_name, :id, :title, subject_ids: [])
  end
end
