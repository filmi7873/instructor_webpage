class AddGradeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :grade, :string
  end
end
