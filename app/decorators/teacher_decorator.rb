class TeacherDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_and_title
    "#{first_name} #{last_name} [#{academic_title}]"
  end
end
