class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.string :presenter_name
      t.text :feedback
      t.integer :score

      t.timestamps
    end
  end
end
