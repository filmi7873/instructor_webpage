class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :event, null: false, foreign_key: true
      t.string :presenter_name
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
