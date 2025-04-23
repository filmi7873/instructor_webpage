class AddPresenterIdToEvaluations < ActiveRecord::Migration[7.1]
  def change
    add_column :evaluations, :presenter_id, :integer
  end
end
