class AddStudentIdToSubjectItem < ActiveRecord::Migration
  def change
    change_table :subject_items do |t|
      t.integer  "student_id"
    end
    add_index "subject_items", ["student_id"], name: "index_subject_items_on_student_id"
  end
end
