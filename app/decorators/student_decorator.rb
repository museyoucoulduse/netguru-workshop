class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes.map(&:value)
    result = notes.empty? ? 0 : (notes.inject(:+) / notes.count.to_f)
    sprintf( "%0.02f", result)
  end

  def date_of_birth
    birthdate ? birthdate.strftime('%Y-%m_%d') : '*'
  end
end
