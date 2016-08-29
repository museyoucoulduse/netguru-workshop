class ReportsController < ApplicationController
  # before_action :authenticate_user!
  expose(:subject_items) { SubjectItem.includes(:teacher, :students).all }
  expose(:subjects) { SubjectItem.includes(:teacher, :students).all }

  def subjects
    render :subjects
  end

end
