class RemoveFeedbackAndScoreFromEvaluations < ActiveRecord::Migration[7.1]
  def change
    remove_column :evaluations, :presenter_name
    remove_column :evaluations, :feedback
    remove_column :evaluations, :score
  end
end