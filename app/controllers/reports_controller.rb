class ReportsController < ApplicationController
  # before_action :authenticate_user!
  expose(:subjects) { SubjectItem.includes(:teacher, :students) }

  def subjects
    render :subjects
  end

end
