class TeacherDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_and_title
    "#{academic_title} #{first_name} #{last_name}"
  end
end
