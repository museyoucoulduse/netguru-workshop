class ReportsController < ApplicationController
  # before_action :authenticate_user!
  expose(:subjects) { SubjectItem.includes(:teacher, :students) }

end
