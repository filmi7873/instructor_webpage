class AddStudentIdToFeedbacks < ActiveRecord::Migration[7.1]
  def change
    add_column :feedbacks, :student_id, :integer
  end
end
