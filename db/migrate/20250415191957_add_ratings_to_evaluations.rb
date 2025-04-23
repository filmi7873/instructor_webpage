class AddRatingsToEvaluations < ActiveRecord::Migration[7.1]
  def change
    add_column :evaluations, :clarity, :integer
    add_column :evaluations, :organization, :integer
    add_column :evaluations, :technical, :integer
    add_column :evaluations, :comments, :text
    add_column :evaluations, :grade, :string
  end
end
