class FixEvaluationsStructure < ActiveRecord::Migration[7.1]
  def up
    # Drop and recreate the evaluations table with the correct structure
    drop_table :evaluations, if_exists: true
    
    create_table :evaluations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.integer :clarity
      t.integer :organization
      t.integer :technical
      t.text :comments

      t.timestamps
    end
  end

  def down
    drop_table :evaluations
  end
end