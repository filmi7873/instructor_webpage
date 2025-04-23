class AddGradeToEventPresenters < ActiveRecord::Migration[7.1]
  def change
    add_column :event_presenters, :grade, :string
  end
end
